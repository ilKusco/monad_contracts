// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VotingWithDeadline {
    mapping(string => uint) public votes;
    mapping(address => bool) public voted;
    uint public deadline;

    constructor(uint _durationInSeconds) {
        deadline = block.timestamp + _durationInSeconds;
    }

    function vote(string memory _option) public {
        require(block.timestamp < deadline, "Voting ended");
        require(!voted[msg.sender], "Already voted");
        votes[_option]++;
        voted[msg.sender] = true;
    }

    function getVote(string memory _option) public view returns (uint) {
        return votes[_option];
    }
}
