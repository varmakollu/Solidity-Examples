/* Create a smart contract that implements a dynamic pricing model for a decentralized storage system. */




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract DynamicPricing {
    address payable public owner;
    uint256 public storagePricePerGB;
    mapping(address => uint256) public userStorage;

    event StoragePurchased(address indexed purchaser, uint256 storageAmount);
    event FundsWithdrawn(address indexed recipient, uint256 amount);

    constructor(uint256 initialStoragePricePerGB) {
        owner = payable(msg.sender);
        storagePricePerGB = initialStoragePricePerGB;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can access this function");
        _;
    }

    function setStoragePrice(uint256 newStoragePricePerGB) external onlyOwner {
        storagePricePerGB = newStoragePricePerGB;
    }

    function purchaseStorage(uint256 storageAmountGB) external payable {
        uint256 totalStoragePrice = storagePricePerGB * storageAmountGB;
        require(msg.value >= totalStoragePrice, "Insufficient funds to purchase storage");
        userStorage[msg.sender] += storageAmountGB;
        emit StoragePurchased(msg.sender, storageAmountGB);
    }

    function withdrawFunds(uint256 amount) external onlyOwner {
        require(address(this).balance >= amount, "Insufficient contract balance");
        owner.transfer(amount);
        emit FundsWithdrawn(owner, amount);
    }
}

