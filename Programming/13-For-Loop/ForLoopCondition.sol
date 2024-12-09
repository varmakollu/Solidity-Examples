// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoopWithCondition {
    uint[] public numbers;
    uint public evenSum;

    function addNumbers(uint[] memory _numbers) public {
        evenSum = 0;
        for (uint i = 0; i < _numbers.length; i++) {
            numbers.push(_numbers[i]);
            if (_numbers[i] % 2 == 0) {
                evenSum += _numbers[i];
            }
        }
    }
}
