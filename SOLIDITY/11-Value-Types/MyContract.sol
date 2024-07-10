// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyContract {
    bool myBool = true;
        int8 myInt = -128;
            uint256 myUint = 123456;
                address myAddress = 0x1234567890123456789012345678901234567890;
                    bytes32 myBytes = "Hello, Solidity!";
                        string myString = "Hello, World!";
                            
                                enum Status { Active, Inactive }
                                    Status myStatus = Status.Active;

                                        uint[] myDynamicArray;
                                            uint[5] myFixedArray;

                                                struct Person {
                                                        string name;
                                                                uint age;
                                                                    }
                                                                        Person myPerson = Person("Alice", 30);

                                                                            mapping(address => uint) public balances;

                                                                                function setBalance(address _address, uint _value) public {
                                                                                        balances[_address] = _value;
                                                                                            }
                                                                                            }
