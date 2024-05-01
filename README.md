David Williams,
C00263768,
SETU Carlow,
BlockChain project.


<h2>Procject description</h2>

<br>Blockchain Technology
<br>Project: Decentralised Vault Manager
<br>Martin Harrigan, martin.harrigan@setu.ie</br>
<br>
This project is due on 26th April 2024 at 23:59. It is worth 50% of your final grade.
Smart contracts can accept, store, and distribute native tokens. Solidity, the most popular programming
language for writing smart contracts for the EVM, has built-in functionality to support this.
In the practicals, we created a decentralised task manager using the Foundry toolkit, specifically, the
forge tool. It allowed anyone to create tasks, to assign the tasks to assignees, to add bounties to the
tasks in the form of native tokens, and to pay the bounties to the assignees when the tasks were marked
as complete.<br>
For this project, you are required to create a decentralised vault manager using the Foundry toolkit. It
should allow anyone to create a vault, a smart contract for storing native tokens. The creator of the
vault automatically becomes its owner. The owner can deposit funds into their vault. The owner can
also withdraw funds from their vault. Of course, it should not be possible for someone to withdraw funds
from a vault that they do not own. Additionally, it should not be possible for someone to withdraw more
funds from a vault than they have previously deposited into the vault.<br>

A class diagram for VaultManager. The contract includes at least two Solidity variables (shown as UML attributes): vaults and vaultsByOwner, and six Solidity functions (shownas UML operations: addVault(), deposit(), withdraw(), getVault(), getVaultsLength(), andgetMyVaults(). Figure 1 shows a UML class diagram for a VaultManager contract. It contains two Solid-ity variables: vaults is an array of type Vault,
where each Vault contains the owner of the vault and the amount of ether in the vault. The con-tract contains six Solidity functions: addVault() allows anyone to create a new vault and add it to the vault manager; deposit() allows the owner of a vault to deposit ether to one of their vaults;
withdraw() allows the owner of a vault to with-draw ether from one of their vaults; getVault()
returns information about a vault, i.e., the owner of the vault and the amount of ether in the vault;
getVaultsLength() returns the total number of vaults that are being managed by the vault man-ager; and getMyVaults() returns the IDs of the vaults that are owned by the address making the
query.<br>

The contract has three events VaultAdded, VaultDeposit, and VaultWithdraw that are fired
when vaults are created, and deposits and with-drawals are made, respectively. Finally, the con-
tract has one modifier, onlyOwner, that ensures that only owners of vaults can perform certain function-
ality, i.e., make deposits and withdrawals.
<br>
Deliverables The project has three deliverables, two of which are Solidity code only, and the third is
Solidity code and a deployment of the smart contract to the Sepolia blockchain:

1. An implementation of the VaultManager smart contract (src/VaultManager.sol). It should pro-
vide implementations for the functions in the class diagram in Fig. 1.
1. A set of test functions written in Solidity (test/VaultManager.t.sol). It should provide test
coverage for all of the functions in VaultManager.sol.
1. A deployment of VaultManager to the Sepolia blockchain. That is, you need to provide a contract
address that points to an instance of the vault manager that is available on Sepolia. In order to
perform the deployment, you will need a deployment script (scripts/VaultManager.s.sol).</br>


Submission You must submit your three source code files on Blackboard. You should also include a
contract address of your deployment on the Sepolia blockchain.
Reminder “All work submitted by learners for assessment purposes, or for written or oral publication,
must be their own work. Where this is informed by the work of others, the source shall be properly
attributed and referenced.” See the SETU Carlow Full-Time Student Handbook, including Academic
Regulations.



<h2>Disclaimer</h2> 

Used ChatGPT to provide help with syntax but also to quickly build the foundation of the code.
This means the functions but not the code within them. <br>
 
Example:<br>
function addVault() public {<br>
    }


I had to edit the foundry.toml file:
----------------------------------------------------------------------------------------------------
[profile.default]
root ="."
src = "src"
out = "out"
libs = ["lib"]

[profile.networks.sepolia]
url = "https://rpc.sepolia.org"
chainID = 11155111

----------------------------------------------------------------------------------------------------

I also had to create a .env file with the following:

RPC_URL=https://rpc.sepolia.dev/
PRIVATE_KEY=0x0f390901be7ae6f355fdcb0bbf1591dac9e9da2a7e96f030e10db68eb72c348b

To make this project run and work.