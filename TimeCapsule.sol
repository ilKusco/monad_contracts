// SocialFi Smart Contract Series - Part 1
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TimeCapsule {
    struct Message {
        string content;
        uint256 unlockTime;
    }

    mapping(address => Message) public capsules;

    constructor() {
        capsules[msg.sender] = Message("gm from the past", block.timestamp + 365 days);
    }

    function open() external view returns (string memory) {
        require(block.timestamp >= capsules[msg.sender].unlockTime, "Too early");
        return capsules[msg.sender].content;
    }
}