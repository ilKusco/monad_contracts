pragma solidity ^0.8.19;

contract DiceGame {
    mapping(address => uint) public wins;

    function roll() external {
        uint result = (uint(blockhash(block.number - 1)) + uint(uint160(msg.sender))) % 6 + 1;
        if (result == 6) wins[msg.sender]++;
    }

    function myWins() external view returns (uint) {
        return wins[msg.sender];
    }
}
