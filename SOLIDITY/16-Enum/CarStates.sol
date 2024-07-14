// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CarStates {
    enum State { 
        Parked,
        Driving,
        Stopped
    }

    State public currentState;

    constructor() {
        currentState = State.Parked;
    }

    function setState(State _state) public {
        currentState = _state;
    }

    function getState() public view returns (State) {
        return currentState;
    }
}
