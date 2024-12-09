// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function isDivisible(int n, int x, int y) public pure returns (bool) {
    require(x > 0 && y > 0, "x and y must be positive non zero numbers");
    return(n % x == 0) && (n % y == 0);
  }
}

// https://www.codewars.com/kata/5545f109004975ea66000086/train/solidity