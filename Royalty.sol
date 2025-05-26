// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Royalty {
    address public artist;
    uint public royaltyPercent;

    constructor(address _artist, uint _percent) {
        artist = _artist;
        royaltyPercent = _percent;
    }

    function payArtist() public payable {
        uint royalty = (msg.value * royaltyPercent) / 100;
        payable(artist).transfer(royalty);
    }
}
