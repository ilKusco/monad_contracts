<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GMContract {
    event GM(address indexed user, string message);

    struct Message {
        address user;
        string text;
    }

    Message[] public gms;

    function sayGM(string calldata _msg) external {
        gms.push(Message(msg.sender, _msg));
        emit GM(msg.sender, _msg);
    }

    function lastGM() external view returns (string memory) {
        if (gms.length == 0) return "";
        return gms[gms.length - 1].text;
    }

    function getGMCount() external view returns (uint256) {
        return gms.length;
    }

    function getLastGMs(uint256 count) external view returns (Message[] memory) {
        uint256 total = gms.length;
        uint256 start = total > count ? total - count : 0;
        uint256 size = total - start;

        Message[] memory recent = new Message[](size);
        for (uint256 i = 0; i < size; i++) {
            recent[i] = gms[start + i];
        }
        return recent;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GMContract {
    event GM(address indexed user, string message);

    struct Message {
        address user;
        string text;
    }

    Message[] public gms;

    function sayGM(string calldata _msg) external {
        gms.push(Message(msg.sender, _msg));
        emit GM(msg.sender, _msg);
    }

    function lastGM() external view returns (string memory) {
        if (gms.length == 0) return "";
        return gms[gms.length - 1].text;
    }

    function getGMCount() external view returns (uint256) {
        return gms.length;
    }

    function getLastGMs(uint256 count) external view returns (Message[] memory) {
        uint256 total = gms.length;
        uint256 start = total > count ? total - count : 0;
        uint256 size = total - start;

        Message[] memory recent = new Message[](size);
        for (uint256 i = 0; i < size; i++) {
            recent[i] = gms[start + i];
        }
        return recent;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
