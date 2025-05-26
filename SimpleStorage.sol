<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint public data;

    function setData(uint _data) public {
        data = _data;
    }

    function getData() public view returns (uint) {
        return data;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint public data;

    function setData(uint _data) public {
        data = _data;
    }

    function getData() public view returns (uint) {
        return data;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
