// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForLoopWithMappings {
    mapping(address => uint) public addressCount;
    address[] public addresses;

    function addAddresses(address[] memory _addresses) public {
        for (uint i = 0; i < _addresses.length; i++) {
            addressCount[_addresses[i]]++;
            addresses.push(_addresses[i]);
        }
    }

    function getAddressCount(address _address) public view returns (uint) {
        return addressCount[_address];
    }
}
