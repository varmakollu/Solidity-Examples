/* Verify Identity */


pragma solidity ^0.8.0;

contract identityVerification {
    mapping(address => bool) public verifiedAddress;

    function identityVerify() public {
        verifiedAddress[msg.sender] = true;
    }

    function isAddressVerified(address userAddress) public view returns (bool) {
        return verifiedAddress[userAddress];
    }
}


