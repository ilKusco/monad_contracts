<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MultiSigWallet {
    address[2] public owners;
    uint public balance;
    bool public approved;

    constructor(address _owner1, address _owner2) {
        owners[0] = _owner1;
        owners[1] = _owner2;
    }

    receive() external payable {
        balance += msg.value;
    }

    function approve() public {
        require(msg.sender == owners[0] || msg.sender == owners[1], "Not authorized");
        approved = true;
    }

    function withdraw(address payable to, uint amount) public {
        require(approved, "Not approved");
        require(msg.sender == owners[0] || msg.sender == owners[1], "Not authorized");
        approved = false;
        balance -= amount;
        to.transfer(amount);
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MultiSigWallet {
    address[2] public owners;
    uint public balance;
    bool public approved;

    constructor(address _owner1, address _owner2) {
        owners[0] = _owner1;
        owners[1] = _owner2;
    }

    receive() external payable {
        balance += msg.value;
    }

    function approve() public {
        require(msg.sender == owners[0] || msg.sender == owners[1], "Not authorized");
        approved = true;
    }

    function withdraw(address payable to, uint amount) public {
        require(approved, "Not approved");
        require(msg.sender == owners[0] || msg.sender == owners[1], "Not authorized");
        approved = false;
        balance -= amount;
        to.transfer(amount);
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
