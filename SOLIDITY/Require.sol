pragma solidity ^0.8.0;

contract Example {
    function myFunction(uint256 _number) external pure returns (uint256) {
        // Require _number to be greater than 0
        require(_number > 0, "Number must be greater than 0");
        
        // Rest of your code here
        return _number * 2;
    }
}
