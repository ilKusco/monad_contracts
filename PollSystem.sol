// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PointTracker {
    mapping(address => uint) public points;

    function earnPoints(uint amount) external {
        require(amount <= 100, "Too many points");
        points[msg.sender] += amount;
    }

    function burnPoints(uint amount) external {
        require(points[msg.sender] >= amount, "Not enough points");
        points[msg.sender] -= amount;
    }

    function getMyPoints() external view returns (uint) {
        return points[msg.sender];
    }
}

