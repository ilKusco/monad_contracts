<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Voting {
    mapping(string => uint) public votes;

    function vote(string memory _option) public {
        votes[_option]++;
    }

    function getVotes(string memory _option) public view returns (uint) {
        return votes[_option];
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Voting {
    mapping(string => uint) public votes;

    function vote(string memory _option) public {
        votes[_option]++;
    }

    function getVotes(string memory _option) public view returns (uint) {
        return votes[_option];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
