# Write a Solidity function to implement a staking system, where users can earn rewards for holding tokens.


```

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

    contract stakeRewards is ERC20{
        mapping(address => uint256) public staked;
        mapping(address => uint256) public stakedFromtimeStamp;
    constructor(uint256) ERC20 ("Fixed Stake", "FIX" ) {
        _mint(msg.sender, 100000000);
    }

    function stake(uint256 amount) external{
        require(amount>0, "amount<0");
        require(balanceOf(msg.sender)>=amount, "insuffient balance");
        _transfer(msg.sender, address(this), amount);
        if(staked[msg.sender] > 0){
            claim();
        }

        stakedFromtimeStamp[msg.sender] = block.timestamp;
        staked[msg.sender] += amount;
    }

    function unstake(uint256 amount) external{
        require(amount > 0, "");
        require(balanceOf(msg.sender)>=amount, "");
        claim();
        staked[msg.sender] -= amount;
        _transfer(address(this), msg.sender, amount);

    }

    function claim() public{
        require(staked[msg.sender]>=0, "");
        uint256 secondsStaked = block.timestamp -  stakedFromtimeStamp[msg.sender];
        uint256 rewards = staked[msg.sender] * secondsStaked / 3.154e7;
        _mint(msg.sender, rewards);
        stakedFromtimeStamp[msg.sender] = block.timestamp;
    }

    
}

```
