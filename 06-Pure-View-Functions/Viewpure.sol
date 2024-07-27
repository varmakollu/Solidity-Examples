// SPDX-License-Identifier: MIT
 pragma solidity 0.8.7;
 
 contract ViewPure {
 
  uint x;
 
  function changeVariable() public {
      x = 100;
  }
 
  function getVariable() public view returns(uint) { 
      return x;
  }
 
  function addNumbers() public pure returns(uint) {
      return (1 + 2);
  }
 }
