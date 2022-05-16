/*

// 			                  _        _                            _   
// 			                 | |      (_)                          | |  
// 			  _ __ ___   __ _| | _____ _ _ __ ___  _ __   __ _  ___| |_ 
// 			 | '_ ` _ \ / _` | |/ / _ \ | '_ ` _ \| '_ \ / _` |/ __| __|
// 			 | | | | | | (_| |   <  __/ | | | | | | |_) | (_| | (__| |_ 
// 			 |_| |_| |_|\__,_|_|\_\___|_|_| |_| |_| .__/ \__,_|\___|\__|
// 			                                      | |                   
// 			                                      |_|   
    
contract erc1155 that creates a custom amount of NFTs lets say 10 every month 

and governance Membership tokens contract erc721 that just creates a userdata storage 

and votetokens erc20 contract with an unlimited supply
and a wallet balance limit of 100 tokens
the 1155 and 721 go "digit=10 ^ 1" and the 20 goes "digit= 10 ^18" 
and here two codes to look at 
token factory we talked last timee

QUESTION:
- Is this the xGOV token? Because on the canva slides, the xGOV is supposed to be 1155. 

 TODO:
 -
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract VoteToken is ERC20 {
	address admin = 0x1Cd6F4D329D38043a6bDB3665c3a7b06F79B5242;
	uint256 maxBalance;
	uint256 digits;

	modifier adminOnly() {
		require(msg.sender == admin);
		_;
	}

	constructor() ERC20('Vote Tokens', ' xGOV') {
		maxBalance = 100;
		digits = 10**18;
	}

	function mint(address _user, uint256 _amount) external adminOnly returns (bool) {
		require(balanceOf(_user) < maxBalance && balanceOf(_user) + _amount <= maxBalance);
		_mint(_user, _amount);
		return true;
	}
}
