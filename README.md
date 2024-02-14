# Escrow-system
This is the escrow Dapp

# User Journey

## Deployment:

A user deploys the smart contract by providing the address of an arbiter during deployment.
The deployed contract initializes the arbiter with the provided address, sets the depositor to the deployer's address (msg.sender), and records the amount of Ether sent with the deployment transaction.


## Deposit:

The Deposit event is emitted, indicating that funds have been successfully deposited.
The amount variable holds the value of the deposited funds.

## Toggle Services:

The arbiter can toggle the servicesDone flag using the toggleServices function.
The ServicesToggled event is emitted, reflecting the updated status of the services.

## Transfer to Beneficiary:

The arbiter calls the transferToBeneficiary function to transfer funds to the beneficiary (the depositor).

This function checks if services have been marked as done (servicesDone is true) before transferring funds.

If services are done, the funds are transferred to the beneficiary using the call function.

The Approved event is emitted, indicating a successful fund transfer.

Please note that the success of the fund transfer relies on the call function, and the contract includes a check (require(success, "Transfer to beneficiary failed");) to handle potential failures

# Deployment on Sepolia 

This is the deployed contract on sepolia testnet.
https://sepolia.etherscan.io/address/0x4506539F26Ef7100FaBB71105eCfDb59709f82a5
