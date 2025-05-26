<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Airdrop {
    mapping(address => bool) public claimed;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function claim() public {
        require(!claimed[msg.sender], "Already claimed");
        claimed[msg.sender] = true;
        payable(msg.sender).transfer(0.01 ether);
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Airdrop {
    mapping(address => bool) public claimed;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function claim() public {
        require(!claimed[msg.sender], "Already claimed");
        claimed[msg.sender] = true;
        payable(msg.sender).transfer(0.01 ether);
    }

    function balance() public view returns (uint) {
        return address(this).balance;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
