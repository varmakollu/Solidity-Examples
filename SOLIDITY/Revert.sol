pragma solidity ^0.8.0;

contract RevertExample {
    function doSomething(uint _number) external pure {
        if (_number == 0) {
            revert("Number must be greater than zero");
        }
        
        // Rest of the function logic...
    }
}
