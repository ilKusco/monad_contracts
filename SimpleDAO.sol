// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleDAO {
    struct Proposal {
        string description;
        uint votes;
    }

    address public owner;
    Proposal[] public proposals;
    mapping(address => bool) public voted;

    constructor() {
        owner = msg.sender;
    }

    function createProposal(string memory desc) public {
        require(msg.sender == owner, "Only owner");
        proposals.push(Proposal(desc, 0));
    }

    function vote(uint index) public {
        require(!voted[msg.sender], "Already voted");
        proposals[index].votes++;
        voted[msg.sender] = true;
    }

    function getProposal(uint index) public view returns (string memory, uint) {
        Proposal memory p = proposals[index];
        return (p.description, p.votes);
    }
}
