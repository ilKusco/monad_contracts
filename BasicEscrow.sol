<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BasicEscrow {
    address public payer;
    address public payee;
    address public arbiter;

    constructor(address _payee, address _arbiter) payable {
        payer = msg.sender;
        payee = _payee;
        arbiter = _arbiter;
    }

    function release() public {
        require(msg.sender == arbiter, "Not arbiter");
        payable(payee).transfer(address(this).balance);
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BasicEscrow {
    address public payer;
    address public payee;
    address public arbiter;

    constructor(address _payee, address _arbiter) payable {
        payer = msg.sender;
        payee = _payee;
        arbiter = _arbiter;
    }

    function release() public {
        require(msg.sender == arbiter, "Not arbiter");
        payable(payee).transfer(address(this).balance);
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
