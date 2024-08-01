// SPDX-License-Identifier: MIT
 pragma solidity 0.8.7;
 contract Parent {
 
  uint public num = 10;
  function increment() public {
      num++;
  }
 }
 
 contract Child is Parent {
  
    function decrement() public {
        num--;
    }
 
    function incrementAndDecrement() public {
        increment();
        decrement();
    }
 }
