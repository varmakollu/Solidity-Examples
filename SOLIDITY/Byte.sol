// Dynamic-Size byte Array


//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
contract MyContract {
 
   bytes a = "Hello";
  
   function returnLength() public view returns(uint) {
      return a.length;
   }
}
