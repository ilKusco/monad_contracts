// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FriendBook {
    mapping(address => string) public names;

    function setName(string memory _name) public {
        names[msg.sender] = _name;
    }

    function getName(address _addr) public view returns (string memory) {
        return names[_addr];
    }
}
