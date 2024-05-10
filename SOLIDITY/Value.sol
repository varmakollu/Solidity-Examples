//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
 
contract MyContract {
   uint num = 2;
 
    function modify(uint _val) public pure returns(uint){
       _val = _val + 1;
       return _val;
   }
 
  
   function modifyNum() public view returns(uint){
       return modify(num);
   }
 
 
   function getNum() public view returns(uint){
       return num;
   }
}
