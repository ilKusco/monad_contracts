// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WhitelistAccess {
    address public owner;
    mapping(address => bool) public whitelisted;

    constructor() {
        owner = msg.sender;
    }

    function addToWhitelist(address _user) public {
        require(msg.sender == owner, "Not owner");
        whitelisted[_user] = true;
    }

    function access() public view returns (string memory) {
        require(whitelisted[msg.sender], "Not whitelisted");
        return "Access granted!";
    }
}
