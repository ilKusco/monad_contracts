// LinkVault - Stores and retrieves favorite links
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract LinkVault {
    mapping(address => string[]) public links;
    function addLink(string calldata url) external {
        links[msg.sender].push(url);
    }
}