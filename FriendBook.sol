<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FriendBook {
    mapping(address => string) public names;

    function setName(string memory _name) public {
        names[msg.sender] = _name;
    }

    function getName(address _addr) public view returns (string memory) {
        return names[_addr];
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FriendBook {
    mapping(address => string) public names;

    function setName(string memory _name) public {
        names[msg.sender] = _name;
    }

    function getName(address _addr) public view returns (string memory) {
        return names[_addr];
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
