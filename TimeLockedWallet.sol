// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SimpleCounter - Un contatore personale per ogni utente
contract SimpleCounter {
    mapping(address => uint256) private counters; // Mappa: indirizzo → contatore

    /// @notice Incrementa il contatore dell'utente chiamante
    function increment() external {
        counters[msg.sender] += 1;
    }

    /// @notice Resetta il contatore dell'utente chiamante a zero
    function reset() external {
        counters[msg.sender] = 0;
    }

    /// @notice Ritorna il valore del proprio contatore
    /// @return Il numero corrente
    function getMyCounter() external view returns (uint256) {
        return counters[msg.sender];
    }
}
