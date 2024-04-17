// Array methods: push, pop, and length.

// SPDX-License-Identifier: MIT
 pragma solidity 0.8.7;
 
 contract Array {
 
    uint[] numArray = [1, 2, 3, 4, 5];
 
    function arrayLength() public view returns(uint) {
        return numArray.length;
    }
 
   function elementByIndex(uint i) public view returns(uint) {
       return numArray[i];
   }
 
    function addValue(uint n) public {
        numArray.push(n);
    }
  
    function popValue() public {
        numArray.pop();
    }
 }
