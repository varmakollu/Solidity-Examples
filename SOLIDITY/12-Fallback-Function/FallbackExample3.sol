// SPDX-License-Identifier: MIT

// Example 3: Fallback with a Default Action


pragma solidity ^0.8.0;

contract FallbackExample3 {
    uint256 public counter;

    // Fallback function to increment the counter
    fallback() external payable {
        counter++;
    }

    // Receive function to increment the counter
    receive() external payable {
        counter++;
    }
}
