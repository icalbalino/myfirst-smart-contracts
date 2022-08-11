// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract Heros {
    // we have three classes.
    enum Class { Mage, Healer, Barbarian }

    // the user gets to select the class that comes in, and we want to be paid money.
    function createHero(Class class) public payable{
        require(msg.value >= 0.05 ether, "Please send more money");
    }
}



/**
# Design
1. We want to be able to generate random Hereos.

2. The user gets to put in their class of hereo on generation
    - classes: Mage, Healer, Barbarian
    - Class will not influence stats created, therefore getting an epic hero will be hard.

3. I want to be paid... 0.05 eth per hero!
4. I should be able to get my heroes I have generated.
5. Heroes should be stored on the chain.
6. stats are strength, health, intellect, magic, dexterity

7. stats are randomly generated
    - A scale of 1 - 18
    - The stats are randomly picked and their amplitude is randomly determined according to the following:
        * Stat 1 can max at 18
        * Stat 2 can max at 17
        * Stat 3 can max at 16
        * ...

8. You could imagine these being an NFT
    - They are non divisable
*/