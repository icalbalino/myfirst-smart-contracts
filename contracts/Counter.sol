// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract Counter {
    uint private counter;
    function count() public returns (uint) {
        counter++;
        console.log("counter", counter);
        return counter;
    }
}