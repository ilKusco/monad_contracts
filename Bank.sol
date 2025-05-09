// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./TestToken.sol";

contract Bank {
    TestToken public token;
    mapping(address => uint256) public balances;

    constructor(address _token) {
        token = TestToken(_token);
    }

    function deposit(uint256 amount) external {
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
    }
}
