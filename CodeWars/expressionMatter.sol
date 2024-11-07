// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function expressionMatter(int a, int b, int c) public pure returns (int) {
    // Calculate all possible combinations
    int result1 = a + b + c;
    int result2 = a * b * c;
    int result3 = a * (b + c);
    int result4 = (a + b) * c;
    int result5 = a + b * c;
    int result6 = a * b + c;

    // Return the maximum of all combinations
    return max(result1, max(result2, max(result3, max(result4, max(result5, result6)))));
  }

  function max(int x, int y) private pure returns (int) {
    return x >= y ? x : y;
  }
}

// This covers every combination possible for a, b, and c as per the constraints and finds the maximum result.


// https://www.codewars.com/kata/5ae62fcf252e66d44d00008e/train/solidity