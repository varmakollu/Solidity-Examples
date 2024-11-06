// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
    function checkForFactor(uint base, uint factor) public pure returns (bool) {
        require(factor > 0, "Factor must be a positive number.");
        return base % factor == 0;
    }
}


// Note: base is a non-negative number, factor is a positive number.

// https://www.codewars.com/kata/55cbc3586671f6aa070000fb/solidity
