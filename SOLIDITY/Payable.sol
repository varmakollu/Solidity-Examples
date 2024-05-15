// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract Payable {
 
 bool paid;
 address payable public owner;
 
 constructor() {
       owner = payable(msg.sender);
 }
 function payment() public payable {
    require(msg.value == 0.1 ether, "Amount not sufficient!");
    paid = true;
 }
 
  function withdraw() public {
     require(msg.sender == owner, "Only owner can withdraw!");
     owner.transfer(address(this).balance);
  }
}
