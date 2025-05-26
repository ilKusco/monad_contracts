<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract dUSDC is ERC20 {
    constructor() ERC20("Degen USDC", "dUSDC") {
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }
}

=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract dUSDC is ERC20 {
    constructor() ERC20("Degen USDC", "dUSDC") {
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }
}

>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
