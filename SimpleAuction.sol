// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleAuction {
    address public highestBidder;
    uint public highestBid;
    address public owner;
    bool public ended;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) public refunds;

    function bid() public payable {
        require(!ended, "Auction ended");
        require(msg.value > highestBid, "Bid too low");

        if (highestBid > 0) {
            refunds[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function withdrawRefund() public {
        uint amount = refunds[msg.sender];
        require(amount > 0, "Nothing to withdraw");
        refunds[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    function endAuction() public {
        require(msg.sender == owner, "Not owner");
        require(!ended, "Already ended");
        ended = true;
        payable(owner).transfer(highestBid);
    }
}
