# Smart contract to withdraw funds.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract WithdrawFunds {
    address payable public owner;
    uint public balance;
    uint public withdrawalLimit;
    uint public withdrawalTime;
    mapping(address => uint) public withdrawals;

    constructor(uint limit) {
        owner = payable(msg.sender);
        withdrawalLimit = limit;
        withdrawalTime = block.timestamp;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw funds.");
        require(amount <= balance, "Insufficient balance for withdrawal");
        require(amount <= withdrawalLimit, "Withdrawal amount exceeds the limit.");
        require(block.timestamp >= withdrawalTime, "Withdrawal time has not yet arrived");
        require(withdrawals[msg.sender] + amount <= withdrawalLimit, "Withdrawal amount exceeds your limit");

        owner.transfer(amount);
        balance -= amount;
        withdrawals[msg.sender] += amount;
        withdrawalTime = block.timestamp;
    }

    function getBalance() public view returns (uint) {
        return balance;
    }
}

