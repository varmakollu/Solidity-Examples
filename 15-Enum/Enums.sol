// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Enum {
    // Define an enumeration with four possible statuses
    enum Status {
        Ordered,
        Shipped,
        Delivered,
        Cancelled
    }

    // State variable to store the current status
    Status public status;

    // Function to set the status
    function setStatus(Status _status) public {
        status = _status;
    }

    // Function to get the current status
    function getStatus() public view returns (Status) {
        return status;
    }
}
