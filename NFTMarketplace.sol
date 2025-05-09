// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NFTMarketplace {
    struct NFT {
        address owner;
        string uri;
        uint price;
        bool listed;
    }

    mapping(uint => NFT) public nfts;
    uint public nftCount;

    function mint(string memory uri) public {
        nfts[nftCount] = NFT(msg.sender, uri, 0, false);
        nftCount++;
    }

    function list(uint id, uint price) public {
        require(nfts[id].owner == msg.sender, "Not owner");
        nfts[id].price = price;
        nfts[id].listed = true;
    }

    function buy(uint id) public payable {
        NFT storage nft = nfts[id];
        require(nft.listed, "Not for sale");
        require(msg.value == nft.price, "Incorrect price");

        payable(nft.owner).transfer(msg.value);
        nft.owner = msg.sender;
        nft.listed = false;
    }
}
