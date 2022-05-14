/*
- governance Membership tokens contract erc721 that just creates a userdata storage
the 1155 and 721 go "digit=10 ^ 1" 


QUESTION: 
- What does it mean to " just create a userdata storage"?
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract GovernanceMembership is ERC721 {
	address admin = 0x1Cd6F4D329D38043a6bDB3665c3a7b06F79B5242;

	modifier adminOnly() {
		require(msg.sender == admin);
		_;
	}

	constructor() ERC721('Governance Membership Tokens', 'GMT') {}

	function mint(address _newMember, uint256 _amount) external adminOnly {
		_mint(_newMember, _amount);
	}
}
