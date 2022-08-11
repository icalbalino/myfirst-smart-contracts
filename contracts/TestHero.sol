// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "./Hero.sol";

// a test class which we can set the random nature to our above class
contract TestHero is Heros {
    uint random;

    function generateRandom() public override view returns (uint) {
        return random;
    }

    function setRandom(uint r) public {
        random = r;
    }

}