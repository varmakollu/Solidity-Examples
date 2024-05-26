// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
 
import "@OpenZeppelin/contracts@4.7.3/access/Ownable.sol";
 
contract MyContract is Ownable {
 
   uint num;
 
   constructor() {
       num = 5;
   }
 
   function increment() public onlyOwner {
       ++num;
   }
 
   function decrement() public onlyOwner {
       --num;
   }
 
   function getNum() public view returns (uint) {
       return num;
   }
}
