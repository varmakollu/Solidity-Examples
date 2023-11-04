# Write a Contract for OTT Subscription based on tiers and basic to annual pack

```

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract SubscriptionService {
    address public owner;
    uint256 public annualPrice;
    uint256 public monthlyPrice;
    uint256 public sixMonthsPrice;

    enum SubscriptionTier { Basic, VIP, Premium }
    enum SubscriptionInterval { Monthly, SixMonths, Annual }

    struct Subscription {
        address subscriber;
        SubscriptionTier tier;
        SubscriptionInterval interval;
        uint256 expirationTimestamp;
    }

    Subscription[] public subscriptions;

    mapping(address => uint256) public subscriberSubscriptionIndex;

    event SubscriptionPurchased(
        address indexed subscriber,
        SubscriptionTier tier,
        SubscriptionInterval interval,
        uint256 expirationTimestamp
    );

    constructor(uint256 _annualPrice, uint256 _monthlyPrice, uint256 _sixMonthsPrice) {
        owner = msg.sender;
        annualPrice = _annualPrice;
        monthlyPrice = _monthlyPrice;
        sixMonthsPrice = _sixMonthsPrice;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can access this function");
        _;
    }

    function purchaseSubscription(SubscriptionTier tier, SubscriptionInterval interval) external payable {
        require(msg.value > 0, "Payment must be provided");
        require(tier >= SubscriptionTier.Basic && tier <= SubscriptionTier.Premium, "Invalid subscription tier");
        require(interval >= SubscriptionInterval.Monthly && interval <= SubscriptionInterval.Annual, "Invalid subscription interval");

        uint256 price = calculateSubscriptionPrice(tier, interval);
        require(msg.value >= price, "Insufficient funds for the selected subscription");

        uint256 expirationTimestamp = block.timestamp + calculateSubscriptionDuration(interval);
        subscriptions.push(Subscription(msg.sender, tier, interval, expirationTimestamp));
        subscriberSubscriptionIndex[msg.sender] = subscriptions.length;

        emit SubscriptionPurchased(msg.sender, tier, interval, expirationTimestamp);
    }

    function calculateSubscriptionPrice(SubscriptionTier tier, SubscriptionInterval interval) public view returns (uint256) {
        require(tier >= SubscriptionTier.Basic && tier <= SubscriptionTier.Premium, "Invalid subscription tier");
        require(interval >= SubscriptionInterval.Monthly && interval <= SubscriptionInterval.Annual, "Invalid subscription interval");

        if (interval == SubscriptionInterval.Monthly) {
            return monthlyPrice;
        } else if (interval == SubscriptionInterval.SixMonths) {
            return sixMonthsPrice;
        } else {
            return annualPrice;
        }
    }

    function calculateSubscriptionDuration(SubscriptionInterval interval) public pure returns (uint256) {
        require(interval >= SubscriptionInterval.Monthly && interval <= SubscriptionInterval.Annual, "Invalid subscription interval");

        if (interval == SubscriptionInterval.Monthly) {
            return 30 days;
        } else if (interval == SubscriptionInterval.SixMonths) {
            return 180 days;
        } else {
            return 365 days;
        }
    }

    function getSubscriptionCount() public view returns (uint256) {
        return subscriptions.length;
    }

    function getSubscriptionByIndex(uint256 index) public view returns (Subscription memory) {
        require(index < subscriptions.length, "Invalid subscription index");

        return subscriptions[index];
    }

    function getSubscriptionBySubscriber(address subscriber) public view returns (Subscription memory) {
        require(subscriberSubscriptionIndex[subscriber] > 0, "Subscriber has no active subscription");

        uint256 index = subscriberSubscriptionIndex[subscriber] - 1;
        return subscriptions[index];
    }

    function setAnnualPrice(uint256 _annualPrice) public onlyOwner {
        annualPrice = _annualPrice;
    }

    function setMonthlyPrice(uint256 _monthlyPrice) public onlyOwner {
        monthlyPrice = _monthlyPrice;
    }

    function setSixMonthsPrice(uint256 _sixMonthsPrice) public onlyOwner {
        sixMonthsPrice = _sixMonthsPrice;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner


```
