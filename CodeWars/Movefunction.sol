// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
    function move(int p, int r) public pure returns (int) {
        return p + (r * 2);
    }
}

// Create a function for the terminal game that takes the current position of the hero and the roll (1-6) and return the new position.

// https://www.codewars.com/kata/563a631f7cbbc236cf0000c2/train/solidity
