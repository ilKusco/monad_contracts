// SocialFi Smart Contract Series - Part 1
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MoodTracker {
    enum Mood {Unknown, Happy, Sad, Angry, Chill}
    mapping(address => Mood) public mood;

    constructor() {
        mood[msg.sender] = Mood.Happy;
    }

    function setMood(uint8 moodCode) external {
        require(moodCode <= uint8(Mood.Chill), "Invalid mood");
        mood[msg.sender] = Mood(moodCode);
    }
}