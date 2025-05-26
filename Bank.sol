<<<<<<< HEAD
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
=======
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
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
