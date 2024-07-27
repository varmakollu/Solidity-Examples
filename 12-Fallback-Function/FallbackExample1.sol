// SPDX-License-Identifier: MIT

// Example 1: Basic Fallback Function

pragma solidity ^0.8.0;

contract MyContract {
    fallback() external payable {
        revert("Function not found");
    }
}
