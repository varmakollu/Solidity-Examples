// SPDX-License-Identifier: MIT
 pragma solidity 0.8.7;
 
 contract ConstructorExample {
 
  uint public price;
  address public owner;
 
  constructor(uint _price) {
      price = _price;
      owner = msg.sender;
  }
 
  function changePrice(uint _price) public {
      require(msg.sender == owner);
      price = _price;
  }
 
  function getPrice() public view returns(uint) {
      return price;
  }
 }
