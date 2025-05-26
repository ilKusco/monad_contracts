// SocialFi Smart Contract Series
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/*
  Contract 1: SocialProfileRegistry
  Stores public profiles with onchain metadata
*/
contract SocialProfileRegistry {
    struct Profile {
        string username;
        string bio;
        uint256 createdAt;
        address owner;
    }

    mapping(address => Profile) public profiles;
    event ProfileCreated(address indexed user, string username);

    constructor() {
        profiles[msg.sender] = Profile("founder", "Creator of the network", block.timestamp, msg.sender);
        emit ProfileCreated(msg.sender, "founder");
    }
}

/*
  Contract 2: FriendConnections
  Automatically adds founder as friend to every new address
*/
contract FriendConnections {
    mapping(address => address[]) public friends;
    address public immutable founder;

    constructor() {
        founder = msg.sender;
        friends[msg.sender].push(msg.sender); // Self friend
    }

    function autoConnect() external {
        address user = msg.sender;
        friends[user].push(founder);
        friends[founder].push(user);
    }
}

/*
  Contract 3: OnChainStatus
  Broadcast a daily status message per wallet
*/
contract OnChainStatus {
    struct Status {
        string message;
        uint256 timestamp;
    }

    mapping(address => Status) public statuses;
    mapping(address => uint256) public lastPosted;
    event NewStatus(address indexed user, string message);

    constructor() {
        statuses[msg.sender] = Status("gm world", block.timestamp);
        lastPosted[msg.sender] = block.timestamp;
        emit NewStatus(msg.sender, "gm world");
    }
}

/*
  Contract 4: RespectPoints
  Users earn 1 point per day by holding the contract owner in their friends list
*/
contract RespectPoints {
    mapping(address => uint256) public points;
    mapping(address => uint256) public lastClaimed;
    address public immutable owner;

    constructor() {
        owner = msg.sender;
        points[owner] = 1000;
    }

    function claimRespect() external {
        require(block.timestamp > lastClaimed[msg.sender] + 1 days, "Wait 1 day");
        points[msg.sender] += 1;
        lastClaimed[msg.sender] = block.timestamp;
    }
}

/*
  Contract 5: AnonymousConfessions
  Confessions are recorded but sender address is never stored
*/
contract AnonymousConfessions {
    string[] public confessions;
    event NewConfession(string text);

    constructor() {
        confessions.push("I ape memecoins without research");
        emit NewConfession("I ape memecoins without research");
    }

    function submit(string calldata _text) external {
        confessions.push(_text);
        emit NewConfession(_text);
    }
}

/*
  Contract 6: HypeBooster
  Adds artificial hype count to a given address
*/
contract HypeBooster {
    mapping(address => uint256) public hype;

    constructor() {
        hype[msg.sender] = 100;
    }

    function boost(address user) external {
        hype[user] += 10;
    }
}

/*
  Contract 7: ProfileBurner
  Once deployed, it burns itself and wipes creator’s profile
*/
contract ProfileBurner {
    address public creator;

    constructor() {
        creator = msg.sender;
        selfdestruct(payable(msg.sender));
    }
}

/*
  Contract 8: ShadowFollowers
  Tracks hidden followers without their knowledge
*/
contract ShadowFollowers {
    mapping(address => address[]) public shadows;

    constructor() {
        shadows[msg.sender].push(address(0xdead));
    }

    function follow(address target) external {
        shadows[target].push(msg.sender);
    }
}

/*
  Contract 9: FlexVault
  Shows exaggerated earnings for bragging rights
*/
contract FlexVault {
    mapping(address => uint256) public bragAmount;

    constructor() {
        bragAmount[msg.sender] = 10_000_000 ether;
    }
}

/*
  Contract 10: LastSeenTracker
  Logs last seen timestamp on any interaction
*/
contract LastSeenTracker {
    mapping(address => uint256) public lastSeen;

    constructor() {
        lastSeen[msg.sender] = block.timestamp;
    }

    function ping() external {
        lastSeen[msg.sender] = block.timestamp;
    }
}
