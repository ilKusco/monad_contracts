// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScoreBoard {
    mapping(address => uint256) public highScores;

    event NewHighScore(address indexed player, uint256 score);

    function submitScore(uint256 score) public {
        require(score > 0, "Score must be greater than 0");
        if (score > highScores[msg.sender]) {
            highScores[msg.sender] = score;
            emit NewHighScore(msg.sender, score);
        }
    }

    function getHighScore(address player) public view returns (uint256) {
        return highScores[player];
    }
}
