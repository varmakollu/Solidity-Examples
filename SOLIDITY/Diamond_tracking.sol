/* Diamond tracking (Easy version) */


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiamondTracking {
    mapping(uint => uint) diamondWeights;

    function importDiamonds(uint[] memory weights) public {
        for (uint i = 0; i < weights.length; i++) {
            uint weight = weights[i];
            diamondWeights[weight] += 1;
        }
    }

    function availableDiamonds(uint weight) public view returns (uint) {
        return diamondWeights[weight];
    }
}



// https://dapp-world.com/problem/diamond-tracking-easy-UiSr/problem
