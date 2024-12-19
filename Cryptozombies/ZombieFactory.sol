// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZombieFactory {

    // Event declaration
    event NewZombie(uint256 zombieId, string name, uint256 dna);

    // Constants
    uint256 private constant dnaDigits = 16;
    uint256 private constant dnaModulus = 10 ** dnaDigits;

    // Structs
    struct Zombie {
        string name;
        uint256 dna;
    }

    // State variables
    Zombie[] public zombies;

    mapping(uint256 => address) public zombieToOwner;
    mapping(address => uint256) public ownerZombieCount;

    // Internal functions
    function _createZombie(string memory _name, uint256 _dna) internal {
        zombies.push(Zombie(_name, _dna));
        uint256 id = zombies.length - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) internal view returns (uint256) {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str, block.timestamp, block.difficulty, msg.sender)));
        return rand % dnaModulus;
    }

    // Public functions
    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0, "You already own a zombie.");
        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
