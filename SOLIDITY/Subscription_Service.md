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
        uint256 price = calculateSubscriptionPrice(tier, interval);

        require(msg.value >= price, "Insufficient funds for the selected subscription");
        
        uint256 expirationTimestamp = block.timestamp + calculateSubscriptionDuration(interval);
        subscriptions.push(Subscription(msg.sender, tier, interval, expirationTimestamp));
        subscriberSubscriptionIndex[msg.sender] = subscriptions.length;

        emit SubscriptionPurchased(msg.sender, tier, interval, expirationTimestamp);
    }

    function calculateSubscriptionPrice(SubscriptionTier tier, SubscriptionInterval interval) public view returns (uint256) {
        if (interval == SubscriptionInterval.Annual) {
            return annualPrice;
        } else if (interval == SubscriptionInterval.SixMonths) {
            return sixMonthsPrice;
        } else {
            return monthlyPrice;
        }
    }

    function calculateSubscriptionDuration(SubscriptionInterval interval) public pure returns (uint256) {
        if (interval == SubscriptionInterval.Annual) {
            return 365 days;
        } else if (interval == SubscriptionInterval.SixMonths) {
            return 6 * 30 days;
        } else {
            return 30 days;
        }
    }

    function getSubscriberSubscription(address subscriber) public view returns (SubscriptionTier, SubscriptionInterval, uint256) {
        require(subscriberSubscriptionIndex[subscriber] > 0, "Subscriber has no active subscription");
        Subscription storage subscription = subscriptions[subscriberSubscriptionIndex[subscriber] - 1];
        return (subscription.tier, subscription.interval, subscription.expirationTimestamp);
    }

    function getSubscriptionCount() public view returns (uint256) {
        return subscriptions.length;
    }
}


```
