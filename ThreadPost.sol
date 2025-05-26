pragma solidity ^0.8.19;

contract ThreadPost {
    struct Post {
        address author;
        string content;
        uint timestamp;
    }

    Post[] public posts;

    function write(string calldata content) external {
        posts.push(Post(msg.sender, content, block.timestamp));
    }

    function getPosts() external view returns (Post[] memory) {
        return posts;
    }

    function totalPosts() external view returns (uint) {
        return posts.length;
    }
}
