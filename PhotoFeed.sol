<<<<<<< HEAD
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
=======
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
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
