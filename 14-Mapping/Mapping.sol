// SPDX-License-Identifier: MIT
 pragma solidity 0.8.7;
 
 contract Mapping {
 
   mapping(address => uint) public balances;
 
   function setBalance(address _address, uint _balance) public {
       balances[_address] = _balance;
   }
  
 function getBalance(address _address) public view returns(uint) {
       return balances[_address];
   }
}
