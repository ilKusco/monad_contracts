// SocialFi Smart Contract Series - Mini Game
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * Contract: GuessTheNumber
 * A simple on-chain guessing game where the first player to guess the correct number wins all the ETH in the contract.
 */
contract GuessTheNumber {
    uint8 private immutable secretNumber;
    address public winner;
    bool public gameEnded;

    event NumberGuessed(address indexed player, uint8 guess, bool correct);
    event GameWon(address indexed winner, uint256 prize);

    constructor() payable {
        require(msg.value > 0, "Prize required");
        secretNumber = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100);
        winner = address(0);
        gameEnded = false;
    }

    function guess(uint8 _guess) external {
        require(!gameEnded, "Game over");
        require(_guess <= 99, "Guess out of range");

        if (_guess == secretNumber) {
            gameEnded = true;
            winner = msg.sender;
            uint256 prize = address(this).balance;
            payable(msg.sender).transfer(prize);
            emit GameWon(msg.sender, prize);
        }

        emit NumberGuessed(msg.sender, _guess, _guess == secretNumber);
    }

    function getHint() external view returns (string memory) {
        if (gameEnded) return "Game already won";
        return "Guess a number between 0 and 99";
    }

    function isGameActive() external view returns (bool) {
        return !gameEnded;
    }
}
