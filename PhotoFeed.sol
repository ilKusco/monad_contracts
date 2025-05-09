pragma solidity ^0.8.19;

contract PhotoFeed {
    struct Photo {
        address author;
        string ipfsHash;
        uint timestamp;
    }

    Photo[] public photos;

    function postPhoto(string calldata ipfsHash) external {
        photos.push(Photo(msg.sender, ipfsHash, block.timestamp));
    }

    function getAll() external view returns (Photo[] memory) {
        return photos;
    }
}
