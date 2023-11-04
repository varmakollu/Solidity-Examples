# Write a smart contract which lets the users make payments to the owner.


```

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payment {
    address payable public owner;
    uint256 public paymentAmount = 1 ether;
    mapping(address => bool) public payments;

    event PaymentReceived(address indexed sender, uint256 amount);

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You have no access");
        _;
    }

    function payMoney() external payable {
        require(msg.value >= paymentAmount, "Insufficient payment");
        payments[msg.sender] = true;
        emit PaymentReceived(msg.sender, msg.value);
    }

    function withdrawFunds(uint256 amount) external onlyOwner {
        uint256 contractBalance = address(this).balance;
        require(amount <= contractBalance, "Insufficient contract balance");
        owner.transfer(amount);
    }
}

```
