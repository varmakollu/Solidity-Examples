/* Storage Smart Contract */



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract StorageContract {
    int private storedValue;

    function store(int newValue) public {
        storedValue = newValue;
    }

    function retrieve() public view returns (int) {
        return storedValue;
    }
}



// https://dapp-world.com/problem/storage-smart-contract-udht/problem
