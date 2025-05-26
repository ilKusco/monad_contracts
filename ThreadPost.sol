<<<<<<< HEAD
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
=======
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
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
