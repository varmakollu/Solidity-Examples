# Question 8: Write a Solidity function to implement a lottery, where users can buy tickets for a chance to win a prize.

```
pragma solidity ^0.8.1;

contract Lottery {
    address public manager;
    address[] public members;
    address payable public winner;
    uint public balance;

    uint constant TICKET_PRICE = 10000000000000000; // 0.01 ether in wei

    constructor() payable {
        manager = msg.sender;
    }

    function buyTicket() public payable {
        require(msg.value == TICKET_PRICE);
        members.push(msg.sender);
        balance += msg.value;
    }

    function random() private view returns (uint) {
        uint delay = block.timestamp % 60; // Get seconds in the current minute
        uint entropy = uint(keccak256(abi.encodePacked(block.timestamp, members.length)));
        uint random_number = uint(keccak256(abi.encodePacked(block.timestamp, entropy, delay)));
        return random_number % members.length;
    }

    function selectWinner() public restricted {
        uint index = random();
        winner = payable(members[index]);
        balance = 0;
        winner.transfer(address(this).balance);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
}

```

