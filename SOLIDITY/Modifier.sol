// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract Modifier {
 
  address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
  address a;
  address b;
  address c;
  uint count;
 
  modifier onlyOwner {
      require(msg.sender == owner);
      _;
      count++;
  }
 
  function example1() public onlyOwner {
      a = msg.sender;
  }
 
  function example2() public onlyOwner {
      b = msg.sender;
  }
 
  function example3() public onlyOwner {
      c = msg.sender;
  }
}
