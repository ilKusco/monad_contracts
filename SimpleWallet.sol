// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
