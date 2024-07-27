// SPDX-License-Identifier: MIT

// Example 4: Receive Ether and Store Balance

pragma solidity ^0.8.0;

contract FallbackExample4 {
    uint256 public balance;

    // Fallback function to update the balance
    fallback() external payable {
        balance += msg.value;
    }

    // Receive function to update the balance
    receive() external payable {
        balance += msg.value;
    }
}
