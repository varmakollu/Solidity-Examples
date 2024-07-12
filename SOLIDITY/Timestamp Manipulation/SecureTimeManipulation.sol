// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureTimeManipulation {
    mapping(address => uint) public lastWithdrawalBlock;
    mapping(address => uint) public balances;

    uint public constant BLOCKS_PER_DAY = 6450; // Roughly the number of Ethereum blocks per day

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(block.number >= lastWithdrawalBlock[msg.sender] + BLOCKS_PER_DAY, "You can only withdraw once every 24 hours");
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;
        lastWithdrawalBlock[msg.sender] = block.number;
        payable(msg.sender).transfer(amount);
    }
}
