// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract Heros {
    // we have three classes.
    enum Class { Mage, Healer, Barbarian }

    // a mapping that takes an addresses and produces out arrays.
    mapping(address => uint[]) addressToHeroes;

    // return a random number (random number generator)
    function generateRandom() public virtual view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
    }

    // a way to access that address by doing a view non-state changing function.
    // which means we could actually call those and get data out from the outside and 
    // we can even call it for free, we only need a provider and don't need a signer 
    function getHeroes() public view returns(uint[] memory){
        return addressToHeroes[msg.sender];
    }

    function getStrength(uint hero) public pure returns(uint32){
        return uint32((hero >> 2) & 0x1F);
    }

    function getHealth(uint hero) public pure returns(uint32){
        return uint32((hero >> 7) & 0x1F);
    }

    function getDex(uint hero) public pure returns(uint32){
        return uint32((hero >> 12) & 0x1F);
    }

    function getIntellect(uint hero) public pure returns(uint32){
        return uint32((hero >> 17) & 0x1F);
    }

    function getMagic(uint hero) public pure returns(uint32){
        return uint32((hero >> 22) & 0x1F);
    }

    // the user gets to select the class that comes in, and we want to be paid money.
    // function that requires a signer and requires eath(eth/ether) for to execute 
    function createHero(Class class) public payable{
        require(msg.value >= 0.05 ether, "Please send more money");

        // stats are strength, health, dexterity, intellect, magic
        uint[] memory stats = new uint[](5);
        stats[0] = 2;
        stats[1] = 7;
        stats[2] = 12;
        stats[3] = 17;
        stats[4] = 22;

        uint len = 5;
        uint hero = uint(class);

        do{
            uint pos = generateRandom() % len;
            uint value = generateRandom() % (13 + len) + 1;

            hero |= value << stats[pos];

            len--;
            stats[pos] = stats[len];
        } while(len > 0);

        addressToHeroes[msg.sender].push(hero);
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
