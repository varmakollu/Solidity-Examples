// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZombieFactory {

    event NewZombie(uint zombieId, string name, uint dna);

    uint constant dnaDigits = 16; // Use `constant` for immutable variables
    uint constant dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    // Create a new zombie
    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.length - 1;
        emit NewZombie(id, _name, _dna);
    }

    // Generate random DNA
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str, block.timestamp)));
        return rand % dnaModulus;
    }

    // Create a random zombie
    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
