# Solidity Programming Problems, Sample DApps, and Vulnerable Codes

This README provides a comprehensive collection of Solidity programming problems, sample decentralized applications (DApps), and examples of vulnerable code. Each section includes solutions to help you understand and solve these issues effectively. The questions and examples are sourced from platforms like Calyptus, DappWorld, Ethernaut, and Ethereum Stack Exchange.

## Table of Contents

1. [Programming Problems](#programming-problems)
2. [Sample DApps](#sample-dapps)
3. [Vulnerable Code Examples](#vulnerable-code-examples)

## Programming Problems

| Problem ID | Description | Solution |
|------------|-------------|----------|
| PP-01      | Create a simple storage contract that allows setting and getting a value. | [Solution](#simple-storage-contract) |
| PP-02      | Implement a voting contract where users can vote and the contract keeps track of the votes. | [Solution](#voting-contract) |
| PP-03      | Write a contract to transfer tokens between accounts. | [Solution](#token-transfer-contract) |

### Simple Storage Contract

**Description**: Create a contract that allows setting and getting a value.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private value;

    function setValue(uint256 _value) public {
        value = _value;
    }

    function getValue() public view returns (uint256) {
        return value;
    }
}
```

### Voting Contract

**Description**: Implement a voting contract where users can vote and the contract keeps track of the votes.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    mapping(address => uint256) public votes;
    address[] public voters;

    function vote() public {
        require(votes[msg.sender] == 0, "Already voted");
        votes[msg.sender] = 1;
        voters.push(msg.sender);
    }

    function getTotalVotes() public view returns (uint256) {
        return voters.length;
    }
}
```

### Token Transfer Contract

**Description**: Write a contract to transfer tokens between accounts.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenTransfer {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}
```

## Sample DApps

| DApp ID | Description | Solution |
|---------|-------------|----------|
| SD-01   | Create a decentralized todo list application. | [Solution](#todo-list-dapp) |
| SD-02   | Implement a simple decentralized auction system. | [Solution](#auction-dapp) |
| SD-03   | Develop a decentralized crowdfunding platform. | [Solution](#crowdfunding-dapp) |

### Todo List DApp

**Description**: Create a decentralized todo list application.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {
    struct Todo {
        string content;
        bool completed;
    }

    Todo[] public todos;

    function addTodo(string memory _content) public {
        todos.push(Todo({
            content: _content,
            completed: false
        }));
    }

    function toggleCompleted(uint _index) public {
        require(_index < todos.length, "Invalid index");
        todos[_index].completed = !todos[_index].completed;
    }

    function getTodos() public view returns (Todo[] memory) {
        return todos;
    }
}
```

### Auction DApp

**Description**: Implement a simple decentralized auction system.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Auction {
    address public highestBidder;
    uint256 public highestBid;

    function bid() public payable {
        require(msg.value > highestBid, "There already is a higher bid");
        if (highestBid != 0) {
            payable(highestBidder).transfer(highestBid);
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
    }

    function endAuction() public {
        // Logic to end the auction
    }
}
```

### Crowdfunding DApp

**Description**: Develop a decentralized crowdfunding platform.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crowdfunding {
    struct Campaign {
        address payable creator;
        uint256 goal;
        uint256 pledged;
        bool completed;
    }

    Campaign[] public campaigns;

    function createCampaign(uint256 _goal) public {
        campaigns.push(Campaign({
            creator: payable(msg.sender),
            goal: _goal,
            pledged: 0,
            completed: false
        }));
    }

    function pledge(uint256 _index) public payable {
        Campaign storage campaign = campaigns[_index];
        require(!campaign.completed, "Campaign already completed");
        campaign.pledged += msg.value;
    }

    function completeCampaign(uint256 _index) public {
        Campaign storage campaign = campaigns[_index];
        require(msg.sender == campaign.creator, "Only creator can complete");
        require(campaign.pledged >= campaign.goal, "Goal not reached");
        campaign.completed = true;
        campaign.creator.transfer(campaign.pledged);
    }

    function getCampaigns() public view returns (Campaign[] memory) {
        return campaigns;
    }
}
```

## Vulnerable Code Examples

| Vulnerability ID | Description | Solution |
|------------------|-------------|----------|
| VC-01            | Re-entrancy vulnerability in a withdrawal function. | [Solution](#re-entrancy-vulnerability) |
| VC-02            | `tx.origin` phishing vulnerability. | [Solution](#tx-origin-phishing-vulnerability) |
| VC-03            | Arithmetic overflow/underflow. | [Solution](#arithmetic-overflow-underflow) |

### Re-entrancy Vulnerability

**Description**: A re-entrancy vulnerability in a withdrawal function.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyVulnerable {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
        balances[msg.sender] -= amount;
    }
}
```

**Solution**:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyFixed {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Transfer failed");
    }
}
```

### tx.origin Phishing Vulnerability

**Description**: A `tx.origin` phishing vulnerability.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TxOriginVulnerable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function withdraw() public {
        require(tx.origin == owner, "Not authorized");
        payable(msg.sender).transfer(address(this).balance);
    }
}
```

**Solution**:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TxOriginFixed {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == owner, "Not authorized");
        payable(msg.sender).transfer(address(this).balance);
    }
}
```

### Arithmetic Overflow/Underflow

**Description**: Arithmetic overflow/underflow vulnerability.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArithmeticVulnerable {
    uint256 public count;

    function increment(uint256 value) public {
        count += value; // Potential overflow
    }

    function decrement(uint256 value) public {
        count -= value; // Potential underflow
    }
}
```

**Solution**:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ArithmeticFixed {
    using SafeMath for uint256;
    uint256 public count;

    function increment(uint256 value) public {
        count = count.add(value);
    }

    function decrement(uint256 value) public {
        count = count.sub(value);
    }
}
```

## Resources

- [Solidity Documentation](https://docs.soliditylang.org/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
- [Smart Contract Security Best Practices](https://consensys.github.io/smart-contract-best-pract