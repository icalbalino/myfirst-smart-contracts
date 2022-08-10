// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract Counter {
    uint counter;
    // function count() public returns (uint) {
    //     counter++;
    //     console.log("counter", counter);
    //     return counter;
    // }

    event CounterInc(uint counter);

    //function writes state
    function count() public {
        counter++;
        console.log("counter is now", counter);
        emit CounterInc(counter);
    }

    //function reads state
    function getCounter() public view returns (uint) {
        return counter;
    }
}
