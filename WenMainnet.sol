<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WenMainnet {
    event Wen(address indexed user, string message);  // Renamed 'msg' to 'message'
    mapping(address => uint256) public cries;

    function cryWen(string calldata message) external {  // Renamed 'msg' to 'message'
        cries[msg.sender]++;
        emit Wen(msg.sender, message);  // Using 'message' instead of 'msg'
    }

    function getMyWens() external view returns (uint256) {
        return cries[msg.sender];
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WenMainnet {
    event Wen(address indexed user, string message);  // Renamed 'msg' to 'message'
    mapping(address => uint256) public cries;

    function cryWen(string calldata message) external {  // Renamed 'msg' to 'message'
        cries[msg.sender]++;
        emit Wen(msg.sender, message);  // Using 'message' instead of 'msg'
    }

    function getMyWens() external view returns (uint256) {
        return cries[msg.sender];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
