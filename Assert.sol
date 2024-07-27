// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssertExample {
    function example(uint256 x) external pure returns (uint256) {
        assert(x != 0);
        return 100 / x;
    }
}
