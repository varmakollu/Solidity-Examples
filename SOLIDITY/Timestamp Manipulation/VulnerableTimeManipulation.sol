// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VulnerableTimeManipulation {
    mapping(address => uint) public lastWithdrawalTime;
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(block.timestamp >= lastWithdrawalTime[msg.sender] + 1 days, "You can only withdraw once every 24 hours");
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;
        lastWithdrawalTime[msg.sender] = block.timestamp;
        payable(msg.sender).transfer(amount);
    }
}
