// David Williams
// C00263768
// SETU Carlow
// BlockChain project
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IERC20 { // contract interface for the ERC20 token
    function transferFrom(address sender, address recipient, uint256 amount) public virtual {} // transfer from the ERC20 token
    function transfer(address recipient, uint256 amount) public virtual {}
}

contract Ownable { // contract interface for the owner
    address public owner;

    constructor() { // constructor for the owner
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "This caller is not the owner of this vault.");
        _; // return to the function below
    }
}

contract VaultManager is Ownable { // return to the function below
    struct Vault {
        address owner;
        uint256 balance;
    }

    mapping(uint256 => Vault) public vaults; // public vaults mapping
    mapping(address => uint256[]) public vaultsByOwner; // public vaultsByOwner mapping

    uint256 public vaultsCount;

    event VaultAdded(address indexed owner, uint256 indexed vaultId); // this event is emitted when a new vault is added
    event VaultDeposit(address indexed owner, uint256 indexed vaultId, uint256 amount); // this event is emitted when a deposit is made
    event VaultWithdraw(address indexed owner, uint256 indexed vaultId, uint256 amount); // this event is emitted when a withdrawal is made

    modifier onlyOwnerOf(uint256 vaultId) {
        require(vaults[vaultId].owner == msg.sender, "Not the owner of the vault");
        _;
    }

    function addVault() public {
        vaultsCount++; // increment vault count to the number of vaults
        vaults[vaultsCount] = Vault(msg.sender, 0); // this creates a new vault with the owner and a balance of 0
        vaultsByOwner[msg.sender].push(vaultsCount); // this adds the vault to the vaultsByOwner mapping
        emit VaultAdded(msg.sender, vaultsCount); // this emits the event
    }

    function deposit(uint256 vaultId, uint256 amount) public {
        require(vaultId <= vaultsCount, "Invalid vault ID"); // this checks if the vaultId is valid
        require(amount > 0, "Amount must be greater than zero"); // this checks if the amount is greater than zero
        IERC20(address(this)).transferFrom(msg.sender, address(this), amount); // this transfers the amount from the sender to the contract
        vaults[vaultId].balance += amount; // this adds the amount to the vault balance
        emit VaultDeposit(msg.sender, vaultId, amount); // this emits the event
    }

    function withdraw(uint256 vaultId, uint256 amount) public onlyOwnerOf(vaultId) {
        require(vaultId <= vaultsCount, "Invalid vault ID"); // this checks if the vaultId is valid
        require(amount <= vaults[vaultId].balance, "Insufficient balance"); // this checks if the amount is less than or equal to the vault balance
        vaults[vaultId].balance -= amount; // this subtracts the amount from the vault balance
        IERC20(address(this)).transfer(msg.sender, amount); // this transfers the amount from the sender to the contract
        emit VaultWithdraw(msg.sender, vaultId, amount); // this emits the event
    }

    function getVault(uint256 vaultId) public view returns (address, uint256) {
        require(vaultId <= vaultsCount, "Invalid vault ID"); // this checks if the vaultId is valid
        return (vaults[vaultId].owner, vaults[vaultId].balance); // this returns the owner and balance of the vault
    }

    function getVaultsLength() public view returns (uint256) { // this function returns the number of vaults
        return vaultsCount; // this returns the number of vaults
    }

    function getMyVaults() public view returns (uint256[] memory) { // this function returns the vaults owned by the caller
        return vaultsByOwner[msg.sender]; // this returns the vaults owned by the caller
    }
}
