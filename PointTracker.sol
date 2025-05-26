<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CoinFlipGame {
    mapping(address => uint) public winnings;

    function flip(bool guess) external payable {
        require(msg.value == 0.01 ether, "0.01 ETH only");
        bool result = (block.timestamp % 2 == 0);
        if (guess == result) {
            winnings[msg.sender] += 0.02 ether;
        }
    }

    function withdraw() external {
        uint amount = winnings[msg.sender];
        require(amount > 0, "Nothing to withdraw");
        winnings[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CoinFlipGame {
    mapping(address => uint) public winnings;

    function flip(bool guess) external payable {
        require(msg.value == 0.01 ether, "0.01 ETH only");
        bool result = (block.timestamp % 2 == 0);
        if (guess == result) {
            winnings[msg.sender] += 0.02 ether;
        }
    }

    function withdraw() external {
        uint amount = winnings[msg.sender];
        require(amount > 0, "Nothing to withdraw");
        winnings[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
