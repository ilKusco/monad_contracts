<<<<<<< HEAD
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
=======
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
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
