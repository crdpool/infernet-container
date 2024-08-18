// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.0;

import {Script, console2} from "forge-std/Script.sol";
import {SaysGM} from "../src/SaysGM.sol";

contract CallContract is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        SaysGM saysGm = SaysGM(0x07947e7b378fE512d0F8CB0Bb4D5F80468496f60); 

        string memory containerId = "hello-world";
        uint16 redundancy = 1000;

        saysGm.sayGM(containerId, redundancy);

        vm.stopBroadcast();
    }
}
