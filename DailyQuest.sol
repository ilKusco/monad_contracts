<<<<<<< HEAD
pragma solidity ^0.8.19;

contract DailyQuest {
    mapping(address => uint256) public lastClaim;
    mapping(address => uint256) public xp;

    function claimXP() external {
        require(block.timestamp > lastClaim[msg.sender] + 1 days, "Wait 24h");
        lastClaim[msg.sender] = block.timestamp;
        xp[msg.sender] += 10;
    }

    function getXP() external view returns (uint256) {
        return xp[msg.sender];
    }
}
=======
pragma solidity ^0.8.19;

contract DailyQuest {
    mapping(address => uint256) public lastClaim;
    mapping(address => uint256) public xp;

    function claimXP() external {
        require(block.timestamp > lastClaim[msg.sender] + 1 days, "Wait 24h");
        lastClaim[msg.sender] = block.timestamp;
        xp[msg.sender] += 10;
    }

    function getXP() external view returns (uint256) {
        return xp[msg.sender];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
