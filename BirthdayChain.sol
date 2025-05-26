// BirthdayChain - Save birthdays
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract BirthdayChain {
    mapping(address => string) public birthday;
    function setBirthday(string calldata date) external {
        birthday[msg.sender] = date;
    }
}