<<<<<<< HEAD
pragma solidity ^0.8.19;
contract AnonymousNotes {
    string[] public notes;
    function write(string calldata _note) external {
        notes.push(_note);
    }
    function getNote(uint index) external view returns (string memory) {
        return notes[index];
    }
    function totalNotes() external view returns (uint) {
        return notes.length;
    }
}
=======
pragma solidity ^0.8.19;
contract AnonymousNotes {
    string[] public notes;
    function write(string calldata _note) external {
        notes.push(_note);
    }
    function getNote(uint index) external view returns (string memory) {
        return notes[index];
    }
    function totalNotes() external view returns (uint) {
        return notes.length;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
