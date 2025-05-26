<<<<<<< HEAD
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title PublicNotes - Guestbook decentralizzato su blockchain
contract PublicNotes {
    struct Note {
        address sender;
        string message;
        uint256 timestamp;
    }

    Note[] public notes; // Lista dei messaggi

    event NoteAdded(address indexed from, string message, uint256 time);

    /// @notice Aggiunge un messaggio al guestbook
    /// @param _message Il messaggio da lasciare
    function leaveNote(string calldata _message) external {
        notes.push(Note(msg.sender, _message, block.timestamp));
        emit NoteAdded(msg.sender, _message, block.timestamp);
    }

    /// @notice Restituisce tutti i messaggi
    function getAllNotes() external view returns (Note[] memory) {
        return notes;
    }

    /// @notice Restituisce il numero totale di messaggi
    function totalNotes() external view returns (uint256) {
        return notes.length;
    }
}
=======
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title PublicNotes - Guestbook decentralizzato su blockchain
contract PublicNotes {
    struct Note {
        address sender;
        string message;
        uint256 timestamp;
    }

    Note[] public notes; // Lista dei messaggi

    event NoteAdded(address indexed from, string message, uint256 time);

    /// @notice Aggiunge un messaggio al guestbook
    /// @param _message Il messaggio da lasciare
    function leaveNote(string calldata _message) external {
        notes.push(Note(msg.sender, _message, block.timestamp));
        emit NoteAdded(msg.sender, _message, block.timestamp);
    }

    /// @notice Restituisce tutti i messaggi
    function getAllNotes() external view returns (Note[] memory) {
        return notes;
    }

    /// @notice Restituisce il numero totale di messaggi
    function totalNotes() external view returns (uint256) {
        return notes.length;
    }
}
>>>>>>> d1a5f8fd630e46d70cb7e078975ddfe77d2805c2
