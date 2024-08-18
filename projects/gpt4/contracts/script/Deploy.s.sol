// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {PromptsGPT} from "../src/PromptsGPT.sol";

contract Deploy is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Log address
        address deployerAddress = vm.addr(deployerPrivateKey);
        console2.log("Loaded deployer: ", deployerAddress);

        address registry = 0x3B1554f346DFe5c482Bb4BA31b880c1C18412170;

        // Create consumer
        PromptsGPT promptsGPT = new PromptsGPT(registry);
        console2.log("Deployed PromptsGPT: ", address(promptsGPT));

        // Execute
        vm.stopBroadcast();
        vm.broadcast();
    }
}
