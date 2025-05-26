<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MessageBoard {
    struct Message {
        address author;
        string text;
        uint256 timestamp;
    }

    Message[] public messages;

    event NewMessage(address indexed author, string text, uint256 timestamp);

    function post(string calldata text) external {
        require(bytes(text).length > 0 && bytes(text).length <= 280, "Invalid length");
        messages.push(Message(msg.sender, text, block.timestamp));
        emit NewMessage(msg.sender, text, block.timestamp);
    }

    function getMessages() external view returns (Message[] memory) {
        return messages;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MessageBoard {
    struct Message {
        address author;
        string text;
        uint256 timestamp;
    }

    Message[] public messages;

    event NewMessage(address indexed author, string text, uint256 timestamp);

    function post(string calldata text) external {
        require(bytes(text).length > 0 && bytes(text).length <= 280, "Invalid length");
        messages.push(Message(msg.sender, text, block.timestamp));
        emit NewMessage(msg.sender, text, block.timestamp);
    }

    function getMessages() external view returns (Message[] memory) {
        return messages;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
