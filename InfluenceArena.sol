// SocialFi Smart Contract Series - Complex Logic Contract
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * Contract: InfluenceArena
 * A decentralized social arena where users stake reputation to challenge others.
 * Winners gain influence, losers lose reputation. Stakes are locked for 1 day per challenge.
 */
contract InfluenceArena {
    struct Player {
        uint256 influence;
        uint256 reputation;
        uint256 lockedUntil;
    }

    struct Challenge {
        address challenger;
        address opponent;
        uint256 stake;
        uint256 createdAt;
        bool resolved;
    }

    mapping(address => Player) public players;
    Challenge[] public challenges;
    event ChallengeCreated(uint256 indexed id, address challenger, address opponent, uint256 stake);
    event ChallengeResolved(uint256 indexed id, address winner, address loser);

    constructor() {
        players[msg.sender] = Player({influence: 100, reputation: 1000, lockedUntil: 0});
    }

    function joinArena() external {
        require(players[msg.sender].reputation == 0, "Already joined");
        players[msg.sender] = Player({influence: 10, reputation: 100, lockedUntil: 0});
    }

    function createChallenge(address _opponent, uint256 _stake) external {
        require(players[msg.sender].reputation >= _stake, "Insufficient reputation");
        require(players[msg.sender].lockedUntil < block.timestamp, "Challenger locked");
        require(players[_opponent].lockedUntil < block.timestamp, "Opponent locked");
        require(_opponent != msg.sender, "Cannot challenge self");

        players[msg.sender].lockedUntil = block.timestamp + 1 days;
        players[_opponent].lockedUntil = block.timestamp + 1 days;

        challenges.push(Challenge({
            challenger: msg.sender,
            opponent: _opponent,
            stake: _stake,
            createdAt: block.timestamp,
            resolved: false
        }));

        emit ChallengeCreated(challenges.length - 1, msg.sender, _opponent, _stake);
    }

    function resolveChallenge(uint256 _id) external {
        Challenge storage c = challenges[_id];
        require(!c.resolved, "Already resolved");
        require(block.timestamp >= c.createdAt + 1 days, "Too early to resolve");

        c.resolved = true;
        bool challengerWins = uint256(keccak256(abi.encodePacked(block.timestamp, c.challenger, c.opponent))) % 2 == 0;
        address winner = challengerWins ? c.challenger : c.opponent;
        address loser = challengerWins ? c.opponent : c.challenger;

        players[winner].influence += c.stake;
        players[winner].reputation += c.stake;
        players[loser].reputation -= c.stake;

        emit ChallengeResolved(_id, winner, loser);
    }

    function getPlayer(address user) external view returns (Player memory) {
        return players[user];
    }

    function getChallenge(uint256 id) external view returns (Challenge memory) {
        return challenges[id];
    }
}