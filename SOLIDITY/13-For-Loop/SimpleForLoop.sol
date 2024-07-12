// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleForLoop {
    uint[] public numbers;
    uint public sum;

    function addNumbers(uint[] memory _numbers) public {
        sum = 0;
        for (uint i = 0; i < _numbers.length; i++) {
            numbers.push(_numbers[i]);
            sum += _numbers[i];
        }
    }
}
