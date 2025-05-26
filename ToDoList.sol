<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ToDoList {
    struct Task {
        string text;
        bool done;
    }

    Task[] public tasks;

    function createTask(string memory _text) public {
        tasks.push(Task(_text, false));
    }

    function toggleDone(uint _index) public {
        tasks[_index].done = !tasks[_index].done;
    }

    function getTaskCount() public view returns (uint) {
        return tasks.length;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ToDoList {
    struct Task {
        string text;
        bool done;
    }

    Task[] public tasks;

    function createTask(string memory _text) public {
        tasks.push(Task(_text, false));
    }

    function toggleDone(uint _index) public {
        tasks[_index].done = !tasks[_index].done;
    }

    function getTaskCount() public view returns (uint) {
        return tasks.length;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
