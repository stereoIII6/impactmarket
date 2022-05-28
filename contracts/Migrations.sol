// 			                  _        _                            _
// 			                 | |      (_)                          | |
// 			  _ __ ___   __ _| | _____ _ _ __ ___  _ __   __ _  ___| |_
// 			 | '_ ` _ \ / _` | |/ / _ \ | '_ ` _ \| '_ \ / _` |/ __| __|
// 			 | | | | | | (_| |   <  __/ | | | | | | |_) | (_| | (__| |_
// 			 |_| |_| |_|\__,_|_|\_\___|_|_| |_| |_| .__/ \__,_|\___|\__|
// 			                                      | |
// 			                                      |_|

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Migrations {
    address public owner = msg.sender;
    uint256 public last_completed_migration;

    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    function setCompleted(uint256 completed) public restricted {
        last_completed_migration = completed;
    }
}
