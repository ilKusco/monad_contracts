<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
