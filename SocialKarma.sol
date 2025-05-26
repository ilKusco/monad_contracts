// SocialFi Smart Contract Series - Part 1
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SocialKarma {
    mapping(address => int256) public karma;

    constructor() {
        karma[msg.sender] = 100;
    }

    function applaud(address user) external {
        karma[user] += 1;
    }

    function boo(address user) external {
        karma[user] -= 1;
    }
}