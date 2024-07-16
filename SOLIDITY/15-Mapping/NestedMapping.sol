// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract NestedMapping {
    mapping(address => mapping(string => uint)) public tokens; // Mapping from address to mapping of token symbol to balance

    function transfer(address recipient, string memory tokenSymbol, uint amount) public {
        require(tokens[msg.sender][tokenSymbol] >= amount, "Insufficient balance");
        tokens[msg.sender][tokenSymbol] -= amount;
        tokens[recipient][tokenSymbol] += amount; // Transfer tokens between addresses
    }

    function balanceOf(address addr, string memory tokenSymbol) public view returns (uint) {
        return tokens[addr][tokenSymbol]; // Get balance of a specific token for an address
    }
}


