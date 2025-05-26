<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyToken {
    string public name = "MyToken";
    string public symbol = "MYT";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function mint(address to, uint amount) public {
        require(msg.sender == owner, "Only owner");
        balanceOf[to] += amount;
        totalSupply += amount;
    }

    function burn(uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }

    function transfer(address to, uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Not enough");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyToken {
    string public name = "MyToken";
    string public symbol = "MYT";
    uint8 public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function mint(address to, uint amount) public {
        require(msg.sender == owner, "Only owner");
        balanceOf[to] += amount;
        totalSupply += amount;
    }

    function burn(uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }

    function transfer(address to, uint amount) public {
        require(balanceOf[msg.sender] >= amount, "Not enough");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
