// SPDX-License-Identifier: MIT

// Example 2: Logging Ether Received

pragma solidity ^0.8.0;

contract FallbackExample2 {
    event Received(address sender, uint256 amount);

    // Fallback function to log received Ether
    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }
}
