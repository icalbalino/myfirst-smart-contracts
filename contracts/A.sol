// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "./Storage.sol";

contract A {
    //uint a;
    AppStorage s;

    function setA(uint _a) public {
        s.a = _a;
    }

    function getA() public view returns(uint) {
        return s.a;
    } 
}

// contract B {
//     uint a;
//     address ContractA;
    
//     constructor(address _A) {
//         ContractA = _A;
//     }

//     function setB(uint _a) public {
//         a = _a;
//         A(ContractA).setA(_a + 1);
//     }

//     function getB() public view returns(uint) {
//         return a;
//     } 
// }

contract B {
    AppStorage s;

    constructor(address _A) {
        s.ContractA = _A;
        s.b = 4;
        s.c = 0x45;
        s.d = 0xF5; 
    }

    function setB(uint _b) public {
        s.b = _b;
        (bool success, bytes memory z) = s.ContractA.delegatecall(
            abi.encodeWithSignature("setA() public view returns(uint256)", _b + 1)
        );

        console.log("success", success);
    }

    function getB() public view returns(uint) {
        return s.b;
    } 
}