/* Write a Solidity function to implement a trustless escrow system, where funds are held in escrow until certain conditions are met. */


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract escrow {

    address payable public buyer;
    address payable public seller;
    address payable public mediator;
    uint amount;

    enum situation {Active, Locked, Released,  Inactive} 
        situation public state;
    
    constructor(address payable _buyer, address payable _seller, address payable _mediator, uint _amount ){

        buyer = _buyer;
        seller = _seller;
        mediator = _mediator;
        amount = _amount;
        //  state = situation.Active;
}

modifier currentSituation(situation _state){
    require(state == _state, "inavlid state");
    _;
}

modifier onlyBuyer{
    require(msg.sender == buyer, "money is not send buy the buyer");
    _;
}

modifier onlySeller{
    require(msg.sender == seller, "money is not sent to the seller");
    _;
}

modifier onlyMediator{
    require(msg.sender == mediator, "money is not in the hands of mediator");
    _;
}

function lock() payable public currentSituation(situation.Active) onlyBuyer {
    require(msg.value == amount, "amount is not met as per escrow");
    state = situation.Locked;
  
}

function release() public currentSituation(situation.Locked) onlySeller{
    seller.transfer(amount); //important step
    state = situation.Released;
}

function refund() public currentSituation(situation.Locked) onlyMediator{
    buyer.transfer(amount);
    state = situation.Inactive ; 
}

 function resolve() public currentSituation(situation.Locked) onlyMediator{
        seller.transfer(amount / 2);
        buyer.transfer(amount / 2);
        state = situation.Inactive;
    }

function getSituation() public view returns(uint){
    return amount;
}

function getBalance() public view returns(uint){
    return address(this).balance; //imp step
}

}
