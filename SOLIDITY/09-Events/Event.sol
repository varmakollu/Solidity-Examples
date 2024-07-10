// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Event {
    
    event ProductAdded(uint productID, uint price);
    
    function addProduct(uint _productID, uint _price) public {
        emit ProductAdded(_productID, _price);
    }
 }
