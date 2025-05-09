// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title EmojiReactions - Reazioni on-chain in stile social
contract EmojiReactions {
    string[] public emojiOptions = [
        unicode"❤️",
        unicode"😂",
        unicode"😮",
        unicode"😢",
        unicode"👎"
    ]; // Emojis disponibili

    mapping(address => string) public reactions; // Reazione per utente
    mapping(string => uint256) public emojiCount; // Conteggio per ogni emoji

    event Reacted(address indexed user, string emoji);

    /// @notice Invia o cambia la propria reazione
    /// @param emoji L'emoji da inviare
    function react(string calldata emoji) external {
        require(validEmoji(emoji), "Invalid emoji");

        string memory previous = reactions[msg.sender];

        // Rimuove conteggio precedente se esiste
        if (bytes(previous).length > 0) {
            emojiCount[previous]--;
        }

        reactions[msg.sender] = emoji;
        emojiCount[emoji]++;
        emit Reacted(msg.sender, emoji);
    }

    /// @notice Verifica se l'emoji è una delle opzioni valide
    /// @param emoji L'emoji da controllare
    function validEmoji(string memory emoji) internal view returns (bool) {
        for (uint i = 0; i < emojiOptions.length; i++) {
            if (
                keccak256(abi.encodePacked(emoji)) ==
                keccak256(abi.encodePacked(emojiOptions[i]))
            ) {
                return true;
            }
        }
        return false;
    }

    /// @notice Ottiene la reazione dell'utente
    function myReaction() external view returns (string memory) {
        return reactions[msg.sender];
    }

    /// @notice Conteggio di una specifica emoji
    function getCount(string calldata emoji) external view returns (uint256) {
        return emojiCount[emoji];
    }
}
