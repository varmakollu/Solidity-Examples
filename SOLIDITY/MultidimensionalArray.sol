// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MultidimensionalArray {
    uint[][] public matrix; // 2D array of dynamic-size subarrays

    function addRow(uint[] memory row) public {
        matrix.push(row); // Add row to the matrix
    }

    function getElement(uint rowIndex, uint colIndex) public view returns (uint) {
        require(rowIndex < matrix.length, "Row index out of bounds");
        require(colIndex < matrix[rowIndex].length, "Column index out of bounds");
        return matrix[rowIndex][colIndex];
    }
}
