// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract FixedSizeArray {
    uint[5] public numbers = [1, 2, 3, 4, 5]; // Fixed-size array of 5 numbers

    function getElement(uint index) public view returns (uint) {
        require(index < 5, "Index out of bounds"); // Ensure index is within range
        return numbers[index];
    }

    function setElement(uint index, uint value) public {
        require(index < 5, "Index out of bounds"); // Ensure index is within range
        numbers[index] = value;
    }
}
