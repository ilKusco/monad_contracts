// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract KarmaSystem {
    mapping(address => uint) public karma;
    mapping(address => mapping(address => bool)) public voted;

    function giveKarma(address to) external {
        require(to != msg.sender, "No self-votes");
        require(!voted[msg.sender][to], "Already voted for this user");
        voted[msg.sender][to] = true;
        karma[to]++;
    }

    function myKarma() external view returns (uint) {
        return karma[msg.sender];
    }
}
