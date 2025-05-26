// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract dUSDCFaucet {
    IERC20 public dUsdc;
    mapping(address => uint256) public lastClaimed;

    uint256 public claimCooldown = 1 hours;
    uint256 public claimAmount = 10 * 10**6; // 10 dUSDC (assumendo 6 decimali)

    constructor(address _dUsdcAddress) {
        dUsdc = IERC20(_dUsdcAddress);
    }

    function claim() external {
        require(block.timestamp - lastClaimed[msg.sender] >= claimCooldown, "Cooldown not finished");
        require(dUsdc.balanceOf(address(this)) >= claimAmount, "Faucet empty");

        lastClaimed[msg.sender] = block.timestamp;
        dUsdc.transfer(msg.sender, claimAmount);
    }

    function setClaimAmount(uint256 _amount) external {
        // just for testing, you can remove or restrict this in prod
        claimAmount = _amount;
    }
}



