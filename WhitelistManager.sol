// WhitelistManager - Add/remove addresses
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract WhitelistManager {
    mapping(address => bool) public whitelist;
    function add(address user) external { whitelist[user] = true; }
    function remove(address user) external { whitelist[user] = false; }
}
