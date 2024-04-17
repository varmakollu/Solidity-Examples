// SPDX-License-Identifier: MIT
 pragma solidity 0.8.7;
 
 contract Struct {
 
   struct Student {
       string name;
       uint roll_num;
       bool qualified;
   }
 
   Student[] public students;
 
   function addStudent(string calldata _name, uint _roll_num,   bool _qualified) public {
 
       students.push(Student(_name, _roll_num, _qualified));
   }
}
