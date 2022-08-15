// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract A {
    uint a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() public view returns(uint) {
        return a;
    } 
}

contract B {
    uint a;
    address ContractA;
    
    constructor(address _A) {
        ContractA = _A;
    }

    function setB(uint _a) public {
        a = _a;
        A(ContractA).setA(_a + 1);
    }

    function getB() public view returns(uint) {
        return a;
    } 
}