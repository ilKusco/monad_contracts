// MirrorTweet - Save a tweet-style message
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract MirrorTweet {
    event Tweeted(address indexed user, string text);
    function tweet(string calldata text) external {
        emit Tweeted(msg.sender, text);
    }
}