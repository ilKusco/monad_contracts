// DailyQuote - Stores a quote of the day
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract DailyQuote {
    string public quote;
    uint256 public lastSet;
    function setQuote(string calldata newQuote) external {
        require(block.timestamp > lastSet + 1 days, "Wait a day");
        quote = newQuote;
        lastSet = block.timestamp;
    }
}