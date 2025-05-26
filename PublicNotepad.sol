// PublicNotepad - Public message board
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract PublicNotepad {
    string[] public messages;
    function write(string calldata msgText) external {
        messages.push(msgText);
    }
}