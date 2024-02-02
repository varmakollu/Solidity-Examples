// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract BasicMapping {
    mapping(address => uint) public balances; // Mapping from address to uint

    function deposit(uint amount) public {
        balances[msg.sender] += amount; // Deposit amount to sender's balance
    }

    function getBalance(address addr) public view returns (uint) {
        return balances[addr]; // Get balance of an address
    }
}

