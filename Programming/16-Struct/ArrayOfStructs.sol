// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ArrayOfStructs {
    struct Person {
        string name;
        uint age;
    }

    Person[] public people; // Array of Person structs

    function addPerson(string memory name, uint age) public {
        people.push(Person(name, age)); // Add Person struct to the array
    }

    function getPerson(uint index) public view returns (Person memory) {
        require(index < people.length, "Index out of bounds"); // Ensure index is within range
        return people[index];
    }
}
