// SPDX-License-Identifier: MIT
 pragma solidity 0.8.7;
 contract Visibility {
 
    uint public num = 10;
    string internal str = "hello"; // Internal by default 
   address myAdd = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
  
    function publicFunc() public view returns(uint) {
        return num;
    }
 
    function privateFunc() private view returns(uint) {
        return num;
    }
 
    function internalFunc() internal view returns(uint) {
        return num;
    }
 
    function externalFunc() external view returns(uint) {
        return num;
    }
 }
