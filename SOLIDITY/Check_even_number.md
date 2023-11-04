# Check even number

```

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract EvenNumberChecker {
    function Checkeven(int number) public pure returns (bool) {
        if (number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }
}

```

- https://dapp-world.com/problem/math-checkeven-qwer/problem
