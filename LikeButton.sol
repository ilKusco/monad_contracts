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
