# SmartContracts---Solidity
//README.txt
->This is smart contract developed using REMIX IDE and solidity ^0.5.13 compiler.
->The Smart Contract uses open source library Safe Math from OpenZeppelin.
->The basic idea is to develop a Ethereum Smart Contract for the implementation of Shared Wallet,this can be instantiated by
a single owner and cannot renounce ownership, the smart contract can be destroyed by the owner, thereby transferring 
all the ethers to the owners account address automatically when the Smart Contract is destroyed.
->This contract can be used in use cases such as in a medium sized organisation to manage and handle funds.
->Only the owner is allowed to transfer funds to the smart contract and the users in the SC can
withdraw the funds whenever necessary.
->The owner has the privellege to withdraw the funds whenever necessary by which the SC automatically detucts 
the allowances from the allocated users.
->The internal structure of the SC holds : 
	-> Transferring funds from Main Account to Smart Contract by the Owner.
	-> Transferring funds from Smart Contract to destination Account by the Owner/User.
	-> Allocating allowances to users by the Owner.
	-> modifying funds to the users by the Owner.
	-> View allocated resource by User.
	-> View SC Balance by Owner.
	-> View User's allowances which is set by the Owner.
	-> Provided with event arguements wherever necessary to interact with UI.(UI logic not provided)
	-> Safe Math library used efficiently to prevent fund overflow/underflow.
	-> Modifers used to secure authenticity of the User.

