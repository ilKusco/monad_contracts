// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Staking {
    mapping(address => uint) public balances;
    mapping(address => uint) public startTime;

    function stake() public payable {
        require(msg.value > 0, "Nothing to stake");
        balances[msg.sender] += msg.value;
        startTime[msg.sender] = block.timestamp;
    }

    function unstake() public {
        require(balances[msg.sender] > 0, "No stake");
        uint timeStaked = block.timestamp - startTime[msg.sender];
        uint reward = (balances[msg.sender] * timeStaked) / 1 weeks;
        uint amount = balances[msg.sender] + reward;
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
