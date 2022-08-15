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
    uint b;
    uint8 c;
    uint8 d;
    address ContractA;

    constructor(address _A) {
        ContractA = _A;
        b = 4;
        c = 0x45;
        d = 0xF5; 
    }

    function setB(uint _b) public {
        b = _b;
        (bool success, bytes memory bbb) = ContractA.delegatecall(
            abi.encodeWithSignature("setA(uint256)", _b + 1)
        );

        console.log("success", success);
    }

    function getB() public view returns(uint) {
        return b;
    } 
}