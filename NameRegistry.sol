// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract NameRegistry {
    mapping(uint => string) public names;
    mapping(uint => address) public owners;
    uint public counter;

    function register(string memory _name) public {
        counter++;
        names[counter] = _name;
        owners[counter] = msg.sender;
    }

    function getMyNames() public view returns (string[] memory) {
        uint count = 0;
        for (uint i = 1; i <= counter; i++) {
            if (owners[i] == msg.sender) count++;
        }

        string[] memory result = new string[](count);
        uint index = 0;
        for (uint i = 1; i <= counter; i++) {
            if (owners[i] == msg.sender) {
                result[index] = names[i];
                index++;
            }
        }

        return result;
    }
}
