<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RandomishNumber {
    function getRandom() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.number, msg.sender))) % 100;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RandomishNumber {
    function getRandom() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.number, msg.sender))) % 100;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
