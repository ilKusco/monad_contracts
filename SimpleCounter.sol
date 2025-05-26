// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title MultiSigWallet - Un portafoglio multi-firma decentralizzato
contract MultiSigWallet {
    address[] public owners;                     // Lista dei proprietari
    mapping(address => bool) public isOwner;     // Mappatura per verifica rapida
    uint public required;                        // Numero di approvazioni richieste

    struct Transaction {
        address to;
        uint value;
        bool executed;
        uint approvals;
    }

    Transaction[] public transactions;                         // Lista delle transazioni proposte
    mapping(uint => mapping(address => bool)) public approved; // Chi ha approvato cosa

    event Deposit(address indexed sender, uint amount);
    event Submit(uint indexed txId);
    event Approve(address indexed owner, uint indexed txId);
    event Execute(uint indexed txId);

    modifier onlyOwner() {
        require(isOwner[msg.sender], "Not an owner");
        _;
    }

    modifier txExists(uint _txId) {
        require(_txId < transactions.length, "Transaction does not exist");
        _;
    }

    modifier notApproved(uint _txId) {
        require(!approved[_txId][msg.sender], "Already approved");
        _;
    }

    modifier notExecuted(uint _txId) {
        require(!transactions[_txId].executed, "Already executed");
        _;
    }

    /// @notice Costruttore, imposta proprietari e numero minimo di approvazioni
    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "Owners required");
        require(_required > 0 && _required <= _owners.length, "Invalid required number");

        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "Invalid owner");
            require(!isOwner[owner], "Owner not unique");
            isOwner[owner] = true;
            owners.push(owner);
        }

        required = _required;
    }

    /// @notice Fallback per ricevere ETH
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    /// @notice Proposta di nuova transazione
    function submit(address _to, uint _value) external onlyOwner {
        transactions.push(Transaction({
            to: _to,
            value: _value,
            executed: false,
            approvals: 0
        }));
        emit Submit(transactions.length - 1);
    }

    /// @notice Approvazione di una transazione da parte di un owner
    function approve(uint _txId) external onlyOwner txExists(_txId) notApproved(_txId) notExecuted(_txId) {
        approved[_txId][msg.sender] = true;
        transactions[_txId].approvals += 1;
        emit Approve(msg.sender, _txId);
    }

    /// @notice Esecuzione della transazione se abbastanza approvazioni
    function execute(uint _txId) external txExists(_txId) notExecuted(_txId) {
        Transaction storage txn = transactions[_txId];
        require(txn.approvals >= required, "Not enough approvals");

        txn.executed = true;
        (bool success, ) = txn.to.call{value: txn.value}("");
        require(success, "Transaction failed");

        emit Execute(_txId);
    }

    /// @notice Restituisce il numero di transazioni proposte
    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }
}
