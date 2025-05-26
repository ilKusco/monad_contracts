<<<<<<< HEAD
pragma solidity ^0.8.19;

contract ReputationScore {
    mapping(address => uint) public rep;
    mapping(address => mapping(address => bool)) public voted;

    function endorse(address user) external {
        require(!voted[msg.sender][user], "Already voted");
        require(user != msg.sender, "No self-endorsements");
        voted[msg.sender][user] = true;
        rep[user]++;
    }

    function getMyRep() external view returns (uint) {
        return rep[msg.sender];
    }
}
=======
pragma solidity ^0.8.19;

contract ReputationScore {
    mapping(address => uint) public rep;
    mapping(address => mapping(address => bool)) public voted;

    function endorse(address user) external {
        require(!voted[msg.sender][user], "Already voted");
        require(user != msg.sender, "No self-endorsements");
        voted[msg.sender][user] = true;
        rep[user]++;
    }

    function getMyRep() external view returns (uint) {
        return rep[msg.sender];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
