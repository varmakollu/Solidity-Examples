// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function maxMultiple(int d, int b) public pure returns (int) {
    require(d > 0 && b > 0, "Divisor and bound muste be positive value. ");
    return (b / d) * d;
  }
}

// https://www.codewars.com/kata/5aba780a6a176b029800041c/train/solidity
