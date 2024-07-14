// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

// This contract uses an enumeration to represent the states of a traffic light.

contract TrafficLight {
    enum Light { Red, Yellow, Green }

    Light public currentLight;
    constructor() {
        currentLight = Light.Red;
    }

    function setLight(Light _light) public {
        currentLight = _light;
    }

    function getLight() public view returns (Light) {
        return currentLight;
    }
}