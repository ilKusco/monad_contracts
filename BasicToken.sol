// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BasicToken {
    mapping(address => uint) public balanceOf;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function mint(address _to, uint _amount) public {
        require(msg.sender == owner, "Not owner");
        balanceOf[_to] += _amount;
    }
}
