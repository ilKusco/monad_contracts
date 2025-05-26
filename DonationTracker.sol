<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DonationTracker {
    mapping(address => uint) public donations;
    uint public totalDonated;

    function donate() public payable {
        donations[msg.sender] += msg.value;
        totalDonated += msg.value;
    }

    function getDonation(address _addr) public view returns (uint) {
        return donations[_addr];
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DonationTracker {
    mapping(address => uint) public donations;
    uint public totalDonated;

    function donate() public payable {
        donations[msg.sender] += msg.value;
        totalDonated += msg.value;
    }

    function getDonation(address _addr) public view returns (uint) {
        return donations[_addr];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
