// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "hardhat/console.sol";

struct AppStorage {
    uint a;
    uint b;
    uint8 c;
    uint8 d;
    address ContractA;
}

// library Storage {
//     bytes32 KEY = keccak256("my-storage-locaton");
//     function get() internal pure returns(AppStorage storage s) {
//         bytes32 k = KEY;
//         assembly {
//             s.slot = k;
//         }
//     }
// }
