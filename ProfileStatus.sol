// ProfileStatus - Tracks current status
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract ProfileStatus {
    mapping(address => string) public status;
    function updateStatus(string calldata newStatus) external {
        status[msg.sender] = newStatus;
    }
}