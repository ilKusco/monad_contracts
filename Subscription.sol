<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Subscription {
    uint public fee = 0.01 ether;
    mapping(address => uint) public subscribers;

    function subscribe() public payable {
        require(msg.value == fee, "Incorrect fee");
        subscribers[msg.sender] = block.timestamp + 30 days;
    }

    function isSubscribed(address user) public view returns (bool) {
        return block.timestamp < subscribers[user];
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Subscription {
    uint public fee = 0.01 ether;
    mapping(address => uint) public subscribers;

    function subscribe() public payable {
        require(msg.value == fee, "Incorrect fee");
        subscribers[msg.sender] = block.timestamp + 30 days;
    }

    function isSubscribed(address user) public view returns (bool) {
        return block.timestamp < subscribers[user];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
