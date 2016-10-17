pragma solidity ^0.4.2;
//Contract defining to the modifier onlyOwner & allowing to transfer the Ownership
//Needed to whitelist Poll participants
contract owned {
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}


//Contract defining the Poll
contract NewPoll is owned {

  //Maps an Address to a Boolean value to whitelist accounts
  mapping (address => bool) public approvedAccount;
    
    
  //defines the poll's properties
  struct Poll {
    address owner;
    string title;
    uint votelimit;
    string options;
    uint deadline;
    bool status;
    uint numVotes;
  }




  // event tracking of all votes
  event NewVote(string votechoice);
  event ApprovedAddress(address target, bool approved);

  // declare a public poll called p
  Poll public p;

  //initiator function that stores the necessary poll information. Needs to have the same name as the contract!
  function NewPoll(string _options, string _title, uint _votelimit, uint _deadline) {
    p.owner = msg.sender;
    p.options = _options;
    p.title = _title;
    p.votelimit = _votelimit;
    p.deadline = _deadline;
    p.status = true;
    p.numVotes = 0;
  }

  //Function whitelisting poll paritcipants
  function approveAddress(address target, bool approved) onlyOwner{
    approvedAccount[target] = approved;
    ApprovedAddress(target, approved);
  }
    

  //function for user vote. input is a string choice
  function vote(string choice) returns (bool) {
    if (msg.sender != p.owner || p.status != true || approvedAccount[msg.sender] != true) {
      return false;
    }

    p.numVotes += 1;
    NewVote(choice);

    // if votelimit reached, end poll
    if (p.votelimit > 0) {
      if (p.numVotes >= p.votelimit) {
        endPoll();
      }
    }
    return true;
  }

  //when time or vote limit is reached, set the poll status to false
  function endPoll() returns (bool) {
    if (msg.sender != p.owner) {
      return false;
    }
    p.status = false;
    return true;
  }
}
