<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Referral {
    mapping(address => address) public referrer;
    mapping(address => uint) public rewards;

    function register(address _referrer) public {
        require(referrer[msg.sender] == address(0), "Already registered");
        require(_referrer != msg.sender, "Can't refer yourself");
        referrer[msg.sender] = _referrer;
    }

    function buy() public payable {
        require(msg.value >= 0.01 ether, "Minimum 0.01 ETH");
        address r = referrer[msg.sender];
        if (r != address(0)) {
            rewards[r] += msg.value / 10; // 10% reward
        }
    }

    function claimReward() public {
        uint reward = rewards[msg.sender];
        require(reward > 0, "No reward");
        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(reward);
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Referral {
    mapping(address => address) public referrer;
    mapping(address => uint) public rewards;

    function register(address _referrer) public {
        require(referrer[msg.sender] == address(0), "Already registered");
        require(_referrer != msg.sender, "Can't refer yourself");
        referrer[msg.sender] = _referrer;
    }

    function buy() public payable {
        require(msg.value >= 0.01 ether, "Minimum 0.01 ETH");
        address r = referrer[msg.sender];
        if (r != address(0)) {
            rewards[r] += msg.value / 10; // 10% reward
        }
    }

    function claimReward() public {
        uint reward = rewards[msg.sender];
        require(reward > 0, "No reward");
        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(reward);
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
