// 6. NFTInbox - Accept and store NFTs
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
interface IERC721 {
    function transferFrom(address from, address to, uint256 tokenId) external;
}
contract NFTInbox {
    mapping(address => uint256[]) public received;
    function receiveNFT(address nft, uint256 tokenId) external {
        IERC721(nft).transferFrom(msg.sender, address(this), tokenId);
        received[msg.sender].push(tokenId);
    }
}