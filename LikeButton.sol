<<<<<<< HEAD
pragma solidity ^0.8.19;
contract LikeButton {
    mapping(address => bool) public liked;
    uint public totalLikes;
    function like() external {
        require(!liked[msg.sender], "Already liked");
        liked[msg.sender] = true;
        totalLikes++;
    }
}
=======
pragma solidity ^0.8.19;
contract LikeButton {
    mapping(address => bool) public liked;
    uint public totalLikes;
    function like() external {
        require(!liked[msg.sender], "Already liked");
        liked[msg.sender] = true;
        totalLikes++;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
