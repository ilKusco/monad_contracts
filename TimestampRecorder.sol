<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TimestampRecorder {
    mapping(address => uint) public lastInteraction;

    function ping() public {
        lastInteraction[msg.sender] = block.timestamp;
    }

    function getLastPing(address _user) public view returns (uint) {
        return lastInteraction[_user];
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TimestampRecorder {
    mapping(address => uint) public lastInteraction;

    function ping() public {
        lastInteraction[msg.sender] = block.timestamp;
    }

    function getLastPing(address _user) public view returns (uint) {
        return lastInteraction[_user];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
