// David Williams
// C00263768
// SETU Carlow
// BlockChain project
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/VaultManager.sol";

contract VaultManagerDeployer {
    function deploy() public returns (address) { // this function deploys the VaultManager contract
        VaultManager vm = new VaultManager(); 
        return address(vm);
    }
}
