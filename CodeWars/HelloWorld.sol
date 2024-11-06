// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract HelloWorld {
    // State variable to store the greeting message
    string public greeting;

    // Constructor to set the default greeting
    constructor() {
        greeting = "Hello World!";
    }

    // Endpoint to retrieve the current greeting message
    function greet() public view returns (string memory) {
        return greeting;
    }

    // Endpoint to update the greeting message
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
    }
}

// Write a smart contract called HelloWorld that will help greet people that interact with it.

// https://www.codewars.com/kata/5a62e568e626c512fd000007/train/solidity
