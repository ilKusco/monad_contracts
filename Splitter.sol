// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Splitter {
    address public recipient1;
    address public recipient2;

    constructor(address _addr1, address _addr2) {
        recipient1 = _addr1;
        recipient2 = _addr2;
    }

    receive() external payable {
        uint half = msg.value / 2;
        payable(recipient1).transfer(half);
        payable(recipient2).transfer(msg.value - half);
    }
}
