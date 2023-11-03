# Calculate factorial


```
pragma solidity ^0.8.0;

contract FactorialCalculator {
    function Factorial(uint n) public pure returns (uint) {
        if (n == 0) {
            return 1;
        }
        
        uint result = 1;
        for (uint i = 1; i <= n; i++) {
            result *= i;
        }
        
        return result;
    }
}

```

- https://dapp-world.com/problem/math-calculate-factorial-tvfh/problem
