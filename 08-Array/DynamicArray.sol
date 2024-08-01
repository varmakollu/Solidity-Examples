// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DynamicArray {
    uint[] public numbers; // Dynamic-size array initialized as empty

    function pushElement(uint value) public {
        numbers.push(value); // Add element to the end
    }

    function getElement(uint index) public view returns (uint) {
        require(index < numbers.length, "Index out of bounds"); // Ensure index is within range
        return numbers[index];
    }
}
