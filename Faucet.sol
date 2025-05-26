<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./TestToken.sol";

contract Faucet {
    TestToken public token;
    mapping(address => uint256) public lastClaim;

    constructor(address _token) {
        token = TestToken(_token);
    }

    function claim() external {
        require(block.timestamp - lastClaim[msg.sender] > 1 hours, "Wait 1 hour");
        lastClaim[msg.sender] = block.timestamp;
        token.mint(msg.sender, 100 * 1e18);
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./TestToken.sol";

contract Faucet {
    TestToken public token;
    mapping(address => uint256) public lastClaim;

    constructor(address _token) {
        token = TestToken(_token);
    }

    function claim() external {
        require(block.timestamp - lastClaim[msg.sender] > 1 hours, "Wait 1 hour");
        lastClaim[msg.sender] = block.timestamp;
        token.mint(msg.sender, 100 * 1e18);
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
