# Prerequisites for the 2. Mainz Ethereum Meetup

In order to not waste a lot of the limited time we have, please install and sync the latest Mist Wallet prior to the Meetup.
This is necessary if you want to code your own smart contract or if you want to interact with one of the coded smart contracts.

<i>Please note that support for participants that have not followed the instructions below, when the Meetup start, will be of lower priority.</i>

- Download the latest Ethereum Wallet application [HERE](https://github.com/ethereum/mist/releases). At the time of writing latest version is 0.8.6
- Once the wallet application is installed, you should start syncing the Ethereum test-net Blockchain. When you run the application for the first time you will be prompted about which network to run. Please choose the test-net since that is the one we will be using during the Meetup. Be advised that syncing might take several hours.

If you have problems with slow syncing please read this thread: https://m.reddit.com/r/ethereum/comments/58bnef/if_you_are_running_a_geth_node_try_refastsyncing/

<b>Don't worry if you can't sync with the testnet - it's not necessecary to join our Meetup :)</b>

Feel free to join our Gitter Channel and ask your questions:
https://gitter.im/ethereum-meetup-mainz/Lobby?utm_source=share-link&utm_medium=link&utm_campaign=share-link

# Instructions for MeetupDice

1. Deploy contract in browser-solidity with "1" in field "Value" (send 1 ETH to deployed contract to be able to pay oraclize.it)
2. Call method "bet" with "1 wei" in field "Value" (send 1 wei with the method call to bet on a dice > 3)
3. Watch Event Log in etherscan
4. Watch Contract address in Mist/Wallet (beware: callback is an usual transaction and takes some time, is not immediate)

# Links

## Solidity Development

### Pre-Basics
 - [A 101 Noob Intro to Programming Smart Contracts on Ethereum](https://medium.com/@ConsenSys/a-101-noob-intro-to-programming-smart-contracts-on-ethereum-695d15c1dab4#.f2m6k5up3)
  
### Basics
- [Solidity ReadTheDocs](https://solidity.readthedocs.io/en/develop/)
- [Learn Solidity in Y Minutes](https://learnxinyminutes.com/docs/solidity/)
- [Monax formerly known as Eris Solidity Tutorials](https://monax.io/docs/tutorials/getting-started/)

### Ether.Camp Studio IDE
- [Ether.Camp ReadTheDocs](https://nogo10.gitbooks.io/ether-camp-live-studio-primer/content/)

### Truffle 
- http://truffle.readthedocs.io/

### Browser-Solidity
- [Browser-Solidity, use with MetaMask](https://ethereum.github.io/browser-solidity)

### Private Chains
 - [Ethereum Consortium Blockhchain Network](https://github.com/Azure/azure-quickstart-templates/tree/master/ethereum-consortium-blockchain-network)

### Quality Assurance / Testing
 - [Ethereum Testing Reference for Studio IDE](https://github.com/ether-camp/ethereum-testing-reference)
 
### "Sidechains" - alternative Solutions for Ethereum Development
 - [Bloc/Blockapps](http://www.blockapps.net/)
 - [Eris](https://www.monax.io)
 
### Best Practices in Solidity development
- [Dapp-a-day by MakerDAO](https://steemit.com/ethereum/@nikolai/dapp-a-day-1-erc20)
- [colony.io on solidity development](https://blog.colony.io/@elena_di)
- [smart contract best practices by consensys](https://github.com/ConsenSys/smart-contract-best-practices)
 
## Ethereum (Dev) Tools

### Ether.Camp
- [Morden Explorer](https://morden.ether.camp/)
- [Mainnet Explorer](https://live.ether.camp/)

### Backend for web3js
- [Infura](https://infura.io/)

### Blockchain Explorer
- [etherscan.io](https://testnet.etherscan.io/)

### MetaMask
- [MetaMask Chrome Browser Plugin](https://metamask.io/)

### Mist
- [Mist Browser](https://github.com/ethereum/mist/releases)

## Oracles

### Developer focussed (callback mechanism)
- [oraclize.it](http://oraclize.it)

### Business focussed (contract creation mechanism)
- [SmartContract](https://testnet.smartcontract.com)

## Ideas for next Meetups

* Injecting Reality: Concept and Implementation of Oracles with oraclize.it
* Using Dapps with MetaMask and Mist
* The DAObakel: what happened and how to avoid it.
* Beyond hello world: Software Engineering Principles in Smart Contract Development
* Organisation of Meetup Groups as Decentral Automonuos Organisations: Creating a Meetup Group DAO
* Beginning Smart Contract Development: browsersolidity, Mist and ether.camp
* Revisiting centralisation: Bridging real world requirements and Ethereum VM
* Dinosaurs Revenge... 0 loc js ... blockchainers.org
* The TAO: The DAO done right
* Hazelchain: the blockchain implemented in Hazelcast

