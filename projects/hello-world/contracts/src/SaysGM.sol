// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

import {console2} from "forge-std/console2.sol";
import {CallbackConsumer} from "infernet-sdk/consumer/Callback.sol";

contract SaysGM is CallbackConsumer {
    constructor(address registry) CallbackConsumer(registry) {}

    function sayGM(string memory containerId, uint16 redundancy) public {
        _requestCompute(
            containerId,
            bytes("Good morning!"),
            redundancy, // redundancy
            address(0), // paymentToken
            0, // paymentAmount
            address(0), // wallet
            address(0) // prover
        );
    }

    event GM(string sth);

    function _receiveCompute(
        uint32 subscriptionId,
        uint32 interval,
        uint16 redundancy,
        address node,
        bytes calldata input,
        bytes calldata output,
        bytes calldata proof,
        bytes32 containerId,
        uint256 index
    ) internal override {
        emit GM("Good morning!");

        console2.log("\n\n"
        "_____  _____ _______ _    _         _\n"
        "|  __ \\|_   _|__   __| |  | |  /\\   | |\n"
        "| |__) | | |    | |  | |  | | /  \\  | |\n"
        "|  _  /  | |    | |  | |  | |/ /\\ \\ | |\n"
        "| | \\ \\ _| |_   | |  | |__| / ____ \\| |____\n"
        "|_|  \\_\\_____|  |_|   \\____/_/    \\_\\______|\n\n");


        console2.log("subscription Id", subscriptionId);
        console2.log("interval", interval);
        console2.log("redundancy", redundancy);
        console2.log("node", node);
        console2.log("input:");
        console2.logBytes(input);
        console2.log("output:");
        console2.logBytes(output);
        (string memory decoded)= abi.decode(output, (string));
        console2.log("decoded output: ", decoded);
        console2.log("proof:");
        console2.logBytes(proof);
    }
}
