// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Voting {
    mapping(string => uint) public votes;

    function vote(string memory _option) public {
        votes[_option]++;
    }

    function getVotes(string memory _option) public view returns (uint) {
        return votes[_option];
    }
}
