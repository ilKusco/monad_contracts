// SimplePoll - Yes/No polling system
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract SimplePoll {
    string public question;
    uint public yes;
    uint public no;
    mapping(address => bool) public voted;
    constructor(string memory q) { question = q; }
    function vote(bool choice) external {
        require(!voted[msg.sender], "Already voted");
        voted[msg.sender] = true;
        if (choice) yes++; else no++;
    }
}