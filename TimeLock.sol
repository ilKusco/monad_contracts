<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TimeLock {
    uint public unlockTime;
    address public owner;

    constructor(uint _durationInSeconds) payable {
        owner = msg.sender;
        unlockTime = block.timestamp + _durationInSeconds;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not owner");
        require(block.timestamp >= unlockTime, "Too early");
        payable(owner).transfer(address(this).balance);
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TimeLock {
    uint public unlockTime;
    address public owner;

    constructor(uint _durationInSeconds) payable {
        owner = msg.sender;
        unlockTime = block.timestamp + _durationInSeconds;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not owner");
        require(block.timestamp >= unlockTime, "Too early");
        payable(owner).transfer(address(this).balance);
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
