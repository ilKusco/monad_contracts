// VotingPower - Assign voting weight manually
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract VotingPower {
    mapping(address => uint256) public power;
    function setPower(address user, uint256 val) external {
        power[user] = val;
    }
}