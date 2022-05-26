
/*

// 			                  _        _                            _   
// 			                 | |      (_)                          | |  
// 			  _ __ ___   __ _| | _____ _ _ __ ___  _ __   __ _  ___| |_ 
// 			 | '_ ` _ \ / _` | |/ / _ \ | '_ ` _ \| '_ \ / _` |/ __| __|
// 			 | | | | | | (_| |   <  __/ | | | | | | |_) | (_| | (__| |_ 
// 			 |_| |_| |_|\__,_|_|\_\___|_|_| |_| |_| .__/ \__,_|\___|\__|
// 			                                      | |                   
// 			                                      |_|   
    

Solidity Style Guide from docs (just a guide, just in case):
(https://docs.soliditylang.org/en/v0.8.13/style-guide.html) 
- Layout contract elements in the following order:
	Pragma statements
	Import statements
	Interfaces
	Libraries
	Contracts

- Inside each contract, library or interface, use the following order:
	Type declarations
	State variables
	Events
	Functions

-Functions should be grouped according to their visibility and ordered:
	constructor
	receive function (if exists)
	fallback function (if exists)
	external
	public
	internal
	private

- Within a grouping, place the view and pure functions last.

QUESTION:
	- How do we give them value so that people would want to stake rSHK? What will  they be used for? 
	(I recently saw a video of a course recommending not to build security tokens but utility tokens,
	 for regulatory reasons)
- Do we have to emit Logs and txs.push on both swaps, addLQ, removeLQ, stake/ unstake weth and stake/unstake?
- How many MLQ are in 1 SHK? or how do they relate to each other?

TODO:
- Use chainlink (	VRF for pool and usd prices of assets )
- Check if more modifiers are necessary.
- Make pool of feesCollected? 
- Try replacing require statements with custom errors IF they consume less gas.
- Check all visibility specifiers and fix if necessary (avoid public).
- Calculate math beehind rSHK value in unstake() functions.
- Transfer rSHK when unstaking.
- Create timeframe for staking (WETH, SHK)

NOTSURE:
- Make uint for totalfeed colledted for each token?
- Oracles vs functions for determining high/low currencies?
- Inherit ERC1155 instead of a erc20?
- User claims rewards from the rSHK contract. The amount is determined by the SHK contrct 
(totalAmount. SHK is 100 * 10**6)
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC1155/ERC1155.sol';

contract PoolMaker is ERC20 {
	address admin = 0x1Cd6F4D329D38043a6bDB3665c3a7b06F79B5242;

	IERC20 public WETH = IERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
	IERC20 public rSHK;
	IERC20 public low;
	IERC20 public high;

	IERC20 internal Token;

	mapping(address => uint256) stakedWETH;
	mapping(address => uint256) stakedSHK;

	//pool Id => user => lowCurrencyQuantity
	mapping(uint256 => mapping(address => uint256)) addedLiquidity;

	struct Transaction {
		uint256 id;
		address user;
		address token1;
		uint256 amount1;
		address token2;
		uint256 amount2;
		uint256 time;
	}
	Transaction[] public txs;
	uint256 txCount;

	struct Liquidity {
		uint256 id;
		address lowCurrency;
		address highCurrency;
		uint256 maxSizeLow;
		uint256 maxSizeHigh;
		uint256 currSizeLow;
		uint256 currSizeHigh;
		uint256 rate;
		uint256 fee;
	}
	Liquidity[] public pools;
	uint256 poolCount;

	// Question: does this stay, or  replaced since we'll use 1155
	ERC20[] public tokens;

	event Log(
		uint256 indexed id,
		address sender,
		address home,
		uint256 num,
		bytes message,
		uint256 time
	);
	uint256 logs;

	modifier adminOnly() {
		require(msg.sender == admin);
		_;
	}

	//
	constructor(address _rSHK) ERC20('Shake Token', 'SHK') {
		rSHK = IERC20(_rSHK);
	}

	fallback() external payable {}

	function withdrawToken(address _contract) external adminOnly returns (bool) {
		Token = IERC20(_contract);
		Token.transfer(admin, Token.balanceOf(address(this)));
		return true;
	}

	function makePool(
		address lowCurrency,
		address highCurrency,
		uint256 lowSize,
		uint256 highSize,
		uint256 rate,
		uint256 fee
	) external adminOnly returns (bool) {
		pools.push(
			Liquidity(poolCount, lowCurrency, highCurrency, lowSize, highSize, 0, 0, rate, fee)
		);
		++poolCount;

		emit Log(logs, msg.sender, address(this), logs, bytes('Pool made'), block.timestamp);
		++logs;

		txs.push(
			Transaction(txCount, msg.sender, lowCurrency, 0, highCurrency, 0, block.timestamp)
		);
		++txCount;

		return true;
	}

	function addLiquidity(uint256 _id, uint256 _lowAmount) external payable returns (bool) {
		Liquidity memory currPool = pools[_id];
		low = IERC20(currPool.lowCurrency);
		high = IERC20(currPool.highCurrency);

		uint256 _highAmount = _lowAmount * currPool.rate;
		require(low.balanceOf(msg.sender) >= _lowAmount, 'invalid amount');
		require(high.balanceOf(msg.sender) >= _highAmount, 'invalid amount');
		require(low.allowance(msg.sender, address(this)) >= _lowAmount);
		require(high.allowance(msg.sender, address(this)) >= _highAmount);
		require((currPool.maxSizeLow - currPool.currSizeLow) >= _lowAmount);

		// todo: Optional? Require that the transferFrom txs are successful before minting
		low.transferFrom(msg.sender, address(this), _lowAmount);
		high.transferFrom(msg.sender, address(this), _highAmount);

		//PercentageOfTotalPoolSize = (100 / maxSIze) * _lowAmount
		uint256 sharePercentage = _divide(10**8, currPool.maxSizeLow) * _lowAmount;

		_mint(msg.sender, sharePercentage);

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				currPool.lowCurrency,
				_lowAmount,
				currPool.highCurrency,
				_highAmount,
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_lowAmount,
			bytes('Liquidity added'),
			block.timestamp
		);
		logs++;

		currPool.currSizeLow += _lowAmount;
		addedLiquidity[currPool.id][msg.sender] += _lowAmount;
		return true;
	}

	function removeLiquidity(uint256 _id, uint256 _lowAmount)
		external
		payable
		returns (bool){
		Liquidity memory currPool = pools[_id];
		require(addedLiquidity[currPool.id][msg.sender] >= _lowAmount);
		require(currPool.currSizeLow >= _lowAmount);
		low = IERC20(currPool.lowCurrency);
		high = IERC20(currPool.highCurrency);

		uint256 _highAmount = _lowAmount * currPool.rate;
		addedLiquidity[currPool.id][msg.sender] -= _lowAmount;
		currPool.currSizeLow -= _lowAmount;
		low.transfer(msg.sender, _lowAmount);
		high.transfer(msg.sender, _highAmount);

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				currPool.lowCurrency,
				_lowAmount,
				currPool.highCurrency,
				_highAmount,
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_lowAmount,
			bytes('Liquidity removed'),
			block.timestamp
		);
		logs++;

		return true;
	}

	function stakeSHK(uint256 _amount) external returns (bool) {
		require(balanceOf(msg.sender) >= _amount, 'Invalid amount');
		transferFrom(msg.sender, address(this), _amount);
		stakedSHK[msg.sender] += _amount;

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				address(this), //todo: replace with address of SHK token
				_amount,
				address(0x0),
				0,
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_amount,
			bytes('Tokens staked'),
			block.timestamp
		);
		logs++;

		return true;
	}

	//TODO: Declare rSHK, calculate amount of rSHK for staking
	function unstakeSHK(uint256 _amount) external returns (bool) {
		require(stakedSHK[msg.sender] >= _amount, 'Invalid amount');
		stakedSHK[msg.sender] -= _amount;
		transfer(msg.sender, _amount);

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				address(this), //todo: replace with address of SHK token
				_amount,
				address(0x0), // //todo: replace with address of rSHK token
				0, // replace with amount (according to staked value and timeframe)
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_amount,
			bytes('Tokens unstaked'),
			block.timestamp
		);
		logs++;

		return true;
	}
	function swapLowHigh(uint256 _id, uint256 _lowAmount) public payable returns (bool) {
		Liquidity memory currPool = pools[_id];
		low = IERC20(currPool.lowCurrency);
		high = IERC20(currPool.highCurrency);

		require(low.balanceOf(msg.sender) >= _lowAmount);
		require(_lowAmount + currPool.currSizeLow <= currPool.maxSizeLow);

		uint256 _highAmount = currPool.rate * _lowAmount;

		// IDK if this is necessary or if Solidity reverts in case value goes under 0 (since its an uint and not an int)
		require(currPool.currSizeHigh - _highAmount >= 0);

		uint256 adminFee = _divide((_lowAmount * currPool.fee), 100);
		uint256 amountOut = _highAmount - adminFee;

		low.transferFrom(msg.sender, admin, adminFee);
		low.transferFrom(msg.sender, address(this), _lowAmount);

		currPool.currSizeLow += _lowAmount;
		currPool.currSizeHigh -= amountOut;
		high.transferFrom(address(this), msg.sender, amountOut);

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				currPool.lowCurrency,
				_lowAmount,
				currPool.highCurrency,
				amountOut,
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_lowAmount,
			bytes('Swapped low-high'),
			block.timestamp
		);
		logs++;

		return true;
	}

	function swapHIghLow(uint256 _id, uint256 _highAmount) public payable returns (bool) {
		Liquidity memory currPool = pools[_id];
		low = IERC20(currPool.lowCurrency);
		high = IERC20(currPool.highCurrency);

		require(high.balanceOf(msg.sender) >= _highAmount);
		require(_highAmount + currPool.currSizeHigh <= currPool.maxSizeHigh);

		uint256 _lowAmount = currPool.rate * _highAmount;

		// IDK if this is necessary or if Solidity reverts in case value goes under 0 (since its an uint and not an int)
		require(currPool.currSizeLow - _lowAmount >= 0);

		uint256 adminFee = _divide((_highAmount * currPool.fee), 100); //check math
		uint256 amountOut = _lowAmount - adminFee;
		high.transferFrom(msg.sender, admin, adminFee);
		high.transferFrom(msg.sender, address(this), amountOut);
		currPool.currSizeHigh += _highAmount;
		currPool.currSizeLow -= amountOut;
		low.transferFrom(address(this), msg.sender, _highAmount);

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				currPool.highCurrency,
				_highAmount,
				currPool.lowCurrency,
				amountOut,
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_highAmount,
			bytes('Swapped high-low'),
			block.timestamp
		);
		logs++;

		return true;
	}
	function stakeWETH(uint256 _amount) public payable returns (bool) {
		require(WETH.balanceOf(msg.sender) >= _amount);
		WETH.transferFrom(msg.sender, address(this), _amount);
		stakedWETH[msg.sender] += _amount;

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				address(WETH),
				_amount,
				address(0x0), // //todo: replace with address of rSHK token
				0, // replace with amount according to staked value (and time as well?)
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_amount,
			bytes('WETH staked'),
			block.timestamp
		);
		logs++;

		return true;
	}

	//TODO: Declare rSHK, calculate amount of rSHK tp give for staking
	function unstakeWETH(uint256 _amount) public payable returns (bool) {
		require(stakedWETH[msg.sender] >= _amount);
		stakedWETH[msg.sender] += _amount;
		WETH.transferFrom(address(this), msg.sender, _amount);

		txs.push(
			Transaction(
				txCount,
				msg.sender,
				address(0x0),
				0,
				address(WETH),
				_amount,
				block.timestamp
			)
		);
		txCount++;

		emit Log(
			logs,
			msg.sender,
			address(this),
			_amount,
			bytes('WETH unstaked'),
			block.timestamp
		);
		logs++;

		return true;
	}
	function changeFee(uint256 _id, uint256 _newFee) external adminOnly {
		pools[_id].fee = _newFee;
	}

	function changeRate(uint256 _id, uint256 _newRate) external adminOnly {
		pools[_id].rate = _newRate;
	}

	function changeRateInt(uint256 _id, uint256 _newRate) internal adminOnly {
		pools[_id].rate = _newRate;
	}

	function _divide(uint256 _a, uint256 _b) internal pure returns (uint256 res) {
		uint256 rem = _a % _b;
		res = (_a - rem) / _b;
	}
}
