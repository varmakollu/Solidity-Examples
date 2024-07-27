/* Calculate Greatest Number */


// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract GreatestNumber {
    function Greater(uint[] memory numbers) public pure returns (uint) {
        require(numbers.length > 0, "Input array must not be empty");

        uint greatest = numbers[0];
        for (uint i = 1; i < numbers.length; i++) {
            if (numbers[i] > greatest) {
                greatest = numbers[i];
            }
        }

        return greatest;
    }
}



// https://dapp-world.com/problem/math-calculate-greatest-uiop/problem
