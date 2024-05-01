// David Williams
// C00263768
// SETU Carlow
// BlockChain project
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol"; // Import the Test contract from the forge-std library
import "../src/VaultManager.sol";

contract VaultManagerTest {
    VaultManager vm;
    address public owner;

    constructor() { // create a new instance of the VaultManager contract
        vm = new VaultManager();
        owner = msg.sender; // Set the owner of the test contract
    }

    function testAddVault() public {
        vm.addVault(); // Add the vault to the test contract
        uint256 vaultId = vm.getVaultsLength() - 1; // Get the vault ID
        (address vaultOwner,) = vm.getVault(vaultId);  // Get the vault owner
        require(vaultOwner == owner, "Vault owner is not correct"); // Get the vault owner from the test contract
        emit pass();
    }

    function testDeposit() public {
        vm.addVault();
        uint256 vaultId = vm.getVaultsLength() - 1; // Get the vault ID
        vm.deposit(vaultId, 10 ether); // Deposit 10 ether to the vault
        (address vaultOwner, uint256 _balance) = vm.getVault(vaultId); // Get the vault owner and balance
        require(vaultOwner == owner, "Vault owner is not correct"); // Check if the vault owner is correct
        require(_balance == 10 ether, "Vault balance is not correct"); // Check if the vault balance is correct
        emit pass();
    }

    function testWithdraw() public {
        vm.addVault();
        uint256 vaultId = vm.getVaultsLength() - 1; // Get the vault ID
        vm.deposit(vaultId, 10 ether); // Deposit 10 ether to the vault
        vm.withdraw(vaultId, 5 ether); // Withdraw 5 ether from the vault
        (address vaultOwner, uint256 _balance) = vm.getVault(vaultId); // Get the vault owner and balance
        require(vaultOwner == owner, "Vault owner is not correct"); // Check if the vault owner is correct
        require(_balance == 5 ether, "Vault balance is not correct"); // Check if the vault balance is correct
        emit pass();
    }

    function testGetVault() public {
        vm.addVault();
        uint256 vaultId = vm.getVaultsLength() - 1; // Get the vault ID from the vault and return the vault owner and balance
        (address vaultOwner, uint256 _balance) = vm.getVault(vaultId); // Get the vault owner and balance
        // Explicitly indicate that the variables are intentionally unused
        vaultOwner; // Get the vault owner
        _balance; // Get the vault balance
        emit pass();
    }


    function testGetVaultsLength() public {
        vm.addVault();
        uint256 vaultsLength = vm.getVaultsLength(); // Get the vault length from the vault and return the vault owner and
        require(vaultsLength == 1, "Vaults length is not correct"); // Get the vault length from the vault and return the vault owner and balance
        emit pass();
    }

    function testGetMyVaults() public {
        vm.addVault();
        uint256[] memory vaultIds = vm.getMyVaults(); // Get the memory vault IDs
        require(vaultIds.length == 1, "Vaults length is not correct"); // Check if the vaults length is correct
        (address vaultOwner,) = vm.getVault(vaultIds[0]); // Get the vault owner
        require(vaultOwner == owner, "Vault owner is not correct"); // Check if the vault owner is correct
        emit pass();
    }

    // Dummy event emission
    event pass();
}
