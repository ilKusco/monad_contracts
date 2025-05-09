// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MiniMarketplace {
    struct Item {
        uint id;
        string name;
        uint price;
        address seller;
        bool sold;
    }

    uint public nextId;
    mapping(uint => Item) public items;

    function listItem(string memory _name, uint _price) public {
        items[nextId] = Item(nextId, _name, _price, msg.sender, false);
        nextId++;
    }

    function buyItem(uint _id) public payable {
        Item storage item = items[_id];
        require(!item.sold, "Already sold");
        require(msg.value == item.price, "Wrong amount");
        item.sold = true;
        payable(item.seller).transfer(msg.value);
    }
}
