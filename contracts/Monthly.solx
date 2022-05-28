/*

// 			                  _        _                            _   
// 			                 | |      (_)                          | |  
// 			  _ __ ___   __ _| | _____ _ _ __ ___  _ __   __ _  ___| |_ 
// 			 | '_ ` _ \ / _` | |/ / _ \ | '_ ` _ \| '_ \ / _` |/ __| __|
// 			 | | | | | | (_| |   <  __/ | | | | | | |_) | (_| | (__| |_ 
// 			 |_| |_| |_|\__,_|_|\_\___|_|_| |_| |_| .__/ \__,_|\___|\__|
// 			                                      | |                   
// 			                                      |_|   
    
	
QUESTION:
- Check for proposal with most votes. with solidity or js?
How many events are needed?

TODO:
- Reward winner gets Governance tokens?

REVIEW:
- Ask for requirements
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC1155/ERC1155.sol';
import '@openzeppelin/contracts/utils/Address.sol';

contract Monthly is ERC1155 {
	using Address for address;

	address admin = 0x1Cd6F4D329D38043a6bDB3665c3a7b06F79B5242;
	uint256 tokenAmount = 10;
	uint256 maxTokenAmount = 30;
	uint256 lockTime = 30 days;

	//user => proposal => vote
	mapping(address => mapping(uint256 => bool)) voteRegistry;

	// token => date
	mapping(uint256 => uint256) public expiryDates;

	struct Token {
		uint256 tokenId;
		uint256 amount;
		uint256 birthDate;
	}
	Token[] public tokens;
	uint256 public tokenId;

	struct Proposal {
		uint256 id;
		string proposal;
		address proposer;
		uint256 time;
		uint256 votes;
	}
	uint256 proposalId;
	Proposal[] public proposals;
	address[] public proposers;
	mapping(address => bool) proposerExists;

	modifier adminOnly() {
		require(msg.sender == admin);
		_;
	}

	constructor() ERC1155('Proposal Tokens') {}

	function createMonthlyTokens(string memory _tokenData)
		external
		adminOnly
		returns (bool)
	{
		//If its the first token, mint normally
		if (tokenId == 0) {
			_createTokens(_tokenData);
		} else if (tokenId > 0) {
			// Do we require that previous tokens has expired before minting new ones?
			require(
				block.timestamp > expiryDates[tokenId - 1],
				'Previous token has not expired'
			);
			_createTokens(_tokenData);
		}

		return true;
	}

	function distributeTokens(address _user, uint256 _amount)
		external
		adminOnly
		returns (bool)
	{
		_setApprovalForAll(admin, _user, true);
		safeTransferFrom(admin, _user, tokenId, _amount, '');
		return true;
	}

	function makeProposal(
		uint256 _tokenId,
		uint256 _amount,
		string memory _proposal
	) public returns (bool) {
		// User need to have tokens
		require(balanceOf(msg.sender, _tokenId) >= _amount);

		// Check if token is valid or expired
		if (expiryDates[_tokenId] >= block.timestamp) {
			_burn(msg.sender, _tokenId, _amount);

			proposals.push(Proposal(proposalId, _proposal, msg.sender, block.timestamp, 0));

			if (!proposerExists[msg.sender]) {
				proposerExists[msg.sender] = true;
				proposers.push(msg.sender);
			}

			++proposalId;
		} else {
			_burn(msg.sender, _tokenId, balanceOf(msg.sender, _tokenId));
		}

		return true;
	}

	function voteForProposal(uint256 _proposalId, uint256 _tokenId)
		external
		returns (bool)
	{
		require(!msg.sender.isContract(), 'Voter is not a valid address');
		require(balanceOf(msg.sender, _tokenId) >= 1, 'Not enough tokens to vote');
		require(msg.sender != proposals[_proposalId].proposer, "Can't vote for own proposal");
		require(
			voteRegistry[msg.sender][_proposalId] == false,
			'You have already voted for this proposal'
		);

		if (expiryDates[_tokenId] >= block.timestamp) {
			_burn(msg.sender, _tokenId, 1);
			++proposals[_proposalId].votes;
			voteRegistry[msg.sender][_proposalId] = true;
		} else {
			//
			_burn(msg.sender, _tokenId, balanceOf(msg.sender, _tokenId));
		}

		return true;
	}

	function changeUri(string memory _uri) external adminOnly returns (bool) {
		_setURI(_uri);
		return true;
	}

	function changeMonthlyAmount(uint256 _amount) external adminOnly returns (bool) {
		if (_amount <= maxTokenAmount) {
			tokenAmount = _amount;
		} else {
			revert('');
		}
		return true;
	}

	// Not needed if proposals are public
	function viewProposers() external view returns (address[] memory) {
		address[] memory _proposers = new address[](proposers.length);

		for (uint256 i = 0; i < proposers.length; i++) {
			_proposers[i] = proposers[i];
		}

		return _proposers;
	}

	function viewProposal(uint256 _id) external view returns (string memory) {
		return proposals[_id].proposal;
	}

	// Not needed if proposals are public
	function listOfProposals() external view returns (Proposal[] memory) {
		return proposals;
	}

	function changeLockTime(uint256 _newLockTime) external adminOnly returns (bool) {
		lockTime = _newLockTime;
		return true;
	}

	function checkTokenExpiry(uint256 _tokenId) external view returns (uint256) {
		require(
			balanceOf(msg.sender, _tokenId) > 0,
			'only token owners cann check for expiration date'
		);
		return expiryDates[_tokenId];
	}

	function _createTokens(string memory _tokenData) internal adminOnly {
		_mint(admin, tokenId, tokenAmount, bytes(_tokenData));
		expiryDates[tokenId] = block.timestamp + lockTime;
		tokens.push(Token(tokenId, tokenAmount, block.timestamp));
		_setURI(_tokenData);
		++tokenId;
	}

	function isExpired(uint256 _tokenId) public view returns (bool result) {
		if (expiryDates[_tokenId] <= block.timestamp) {
			return true;
		} else if (expiryDates[_tokenId] > block.timestamp) {
			return false;
		}
	}
}
