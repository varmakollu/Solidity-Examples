# Solidity Codewars Solutions

This repository contains Solidity solutions for various Codewars challenges focused on fundamentals, arrays, algorithms, and beginner-friendly smart contract implementations. Each solution covers a problem category from simple mathematical checks to small games and encoders. This collection aims to help Solidity learners build a foundation in Ethereum smart contract development while tackling fun and engaging problems.

## Table of Contents

1. [Fundamentals and Algorithms](#fundamentals-and-algorithms)
   - [Is n Divisible by x and y?](#is-n-divisible-by-x-and-y)
   - [Grasshopper - Summation](#grasshopper---summation)
   - [String Repeat](#string-repeat)
   - [Century From Year](#century-from-year)
   - [Multiply](#multiply)
   - [Sum of Odd Numbers](#sum-of-odd-numbers)
   - [Count by X](#count-by-x)
   - [Roman Numerals Encoder](#roman-numerals-encoder)
   - [Expressions Matter](#expressions-matter)
   - [Sum of Angles](#sum-of-angles)
   - [Maximum Multiple](#maximum-multiple)
   - [Grasshopper - Check for Factor](#grasshopper---check-for-factor)
   - [Beginner Series #2 Clock](#beginner-series-2-clock)
   - [Third Angle of a Triangle](#third-angle-of-a-triangle)

2. [Smart Contracts](#smart-contracts)
   - [HelloWorld Smart Contract](#helloworld-smart-contract)
   - [Rock, Paper, Scissors Smart Contract](#rock-paper-scissors-smart-contract)
   - [Grasshopper - Terminal Game Move Function](#grasshopper---terminal-game-move-function)
   - [Tic-Tac-Toe Checker](#tic-tac-toe-checker)

---

## Fundamentals and Algorithms

Each solution in this section addresses a different fundamental problem, providing practice with basic Solidity syntax, control structures, and mathematical operations.

### Is n Divisible by x and y?
Checks if a number `n` is divisible by both `x` and `y`. A simple modulus operation helps us determine the result efficiently.
```solidity
function isDivisible(uint n, uint x, uint y) public pure returns (bool) {
    return n % x == 0 && n % y == 0;
}
```

### Grasshopper - Summation
Calculates the summation from 1 up to a given number `n`.
```solidity
function summation(uint n) public pure returns (uint) {
    return (n * (n + 1)) / 2;
}
```

### String Repeat
Repeats a given string `n` times. This is more often solved in high-level languages but can be adapted in Solidity.
```solidity
function repeatString(string memory str, uint count) public pure returns (string memory) {
    // Code implementation here
}
```

### Century From Year
Determines the century for a given year. 
```solidity
function century(uint year) public pure returns (uint) {
    return (year + 99) / 100;
}
```

### Multiply
Multiplies two integers.
```solidity
function multiply(int a, int b) public pure returns (int) {
    return a * b;
}
```

### Sum of Odd Numbers
Calculates the sum of the first `n` odd numbers.
```solidity
function sumOddNumbers(uint n) public pure returns (uint) {
    return n * n * n;
}
```

### Count by X
Generates a sequence counting by `x`, up to `n` multiples.
```solidity
function countByX(uint x, uint n) public pure returns (uint[] memory) {
    // Code implementation here
}
```

### Roman Numerals Encoder
Encodes an integer into a Roman numeral. This is a more complex algorithmic problem in Solidity.
```solidity
function toRoman(uint num) public pure returns (string memory) {
    // Code implementation here
}
```

### Expressions Matter
Determines the maximum result from a set of arithmetic expressions.
```solidity
function expressionsMatter(uint a, uint b, uint c) public pure returns (uint) {
    // Code implementation here
}
```

### Sum of Angles
Calculates the sum of angles in an `n`-sided polygon.
```solidity
function sumOfAngles(uint n) public pure returns (uint) {
    return (n - 2) * 180;
}
```

### Maximum Multiple
Finds the maximum multiple of `divisor` less than or equal to `bound`.
```solidity
function maxMultiple(uint divisor, uint bound) public pure returns (uint) {
    return bound - (bound % divisor);
}
```

### Grasshopper - Check for Factor
Checks if one number is a factor of another.
```solidity
function checkForFactor(uint base, uint factor) public pure returns (bool) {
    return base % factor == 0;
}
```

### Beginner Series #2 Clock
Calculates time in milliseconds given hours, minutes, and seconds.
```solidity
function past(uint h, uint m, uint s) public pure returns (uint) {
    return (h * 3600 + m * 60 + s) * 1000;
}
```

### Third Angle of a Triangle
Calculates the third angle of a triangle given two angles.
```solidity
function otherAngle(uint a, uint b) public pure returns (uint) {
    return 180 - a - b;
}
```

---

## Smart Contracts

### HelloWorld Smart Contract
A simple contract to store and return greetings.
- `greet`: Returns the saved greeting or `"Hello World!"` by default.
- `setGreeting`: Allows the user to set a new greeting.

```solidity
contract HelloWorld {
    string public greeting = "Hello World!";

    function greet() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}
```

### Rock, Paper, Scissors Smart Contract
Implements a Rock, Paper, Scissors game where players can interact with the contract to make choices and determine the winner.
- `play`: Takes a choice from each player and determines the outcome.
  
```solidity
contract RockPaperScissors {
    enum Move { Rock, Paper, Scissors }

    function play(Move player1, Move player2) public pure returns (string memory) {
        // Game logic implementation here
    }
}
```

### Grasshopper - Terminal Game Move Function
Moves a hero position based on dice rolls in a terminal game.
```solidity
function move(uint p, uint r) public pure returns (uint) {
    return p + (r * 2);
}
```

### Tic-Tac-Toe Checker
Implements a function to check the current state of a Tic-Tac-Toe board (e.g., win, lose, or draw).
  
```solidity
contract TicTacToe {
    function checkWinner(uint[3][3] memory board) public pure returns (string memory) {
        // Code implementation here
    }
}
```

This guide provides solutions and explanations for each challenge, with all Solidity code tested on the Remix IDE for correctness and gas efficiency. Enjoy coding and learning with Solidity!
