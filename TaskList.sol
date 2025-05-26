// TaskList - Basic todo manager
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract TaskList {
    struct Task {
        string description;
        bool completed;
    }
    mapping(address => Task[]) public tasks;
    function addTask(string calldata desc) external {
        tasks[msg.sender].push(Task(desc, false));
    }
    function completeTask(uint index) external {
        tasks[msg.sender][index].completed = true;
    }
}
