// Accepts small donations and logs messages
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract TipJar {
    event Tipped(address indexed sender, uint256 amount, string message);
    function tip(string calldata message) external payable {
        require(msg.value > 0, "No tip");
        emit Tipped(msg.sender, msg.value, message);
    }
}