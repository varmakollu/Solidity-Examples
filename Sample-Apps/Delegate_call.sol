// To make this work I needed to use a lot of gas in the test environment or it will fail

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Original contract
contract Satellite1 {
    //these state variables need to be in the exact same order of contract A when performing a delegate call
    uint public num;
    address public sender;
    uint public value;
    
    constructor() public { owner = msg.sender; }
    address payable owner;
    
    //capture the following data and save it in the state variables
    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
    
    //send funds back to the owner and destroy the contract
    function Destruct() public {
        selfdestruct(owner);
    }

}

//Now lets say we want to upgrade contract B and we create B2
contract Satellite2 {
    //these state variables need to be in the exact same order of contract A when performing a delegate call
    uint public num;
    address public sender;
    uint public value;
    
    constructor() public { owner = msg.sender; }
    address payable owner;
    
    //capture the following data and save it in the state variables
    function setVars(uint _num) public payable {
        //lets multiply the num by 2 so we can see a change
        num = 2 * _num;
        sender = msg.sender;
        value = msg.value;
    }
    
     //send funds back to the owner and destroy the contract
    function Destruct() public {
        selfdestruct(owner);
    }
}
