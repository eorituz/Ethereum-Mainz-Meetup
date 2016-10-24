// Ethereum + Solidity
// This code sample & more @ dev.oraclize.it
// deploy in browser-solidity with 1 ETH as value

pragma solidity ^0.4.2;

import "github.com/oraclize/ethereum-api/oraclizeAPI_0.4.sol";

contract SimpleDice is usingOraclize {
  mapping (bytes32 => address) bets;
    
  event Log(string message);
  
  function __callback(bytes32 myid, string result) {
    if (msg.sender != oraclize_cbAddress()) throw;
    if ((parseInt(result) > 3) && (bets[myid].send(2))) {
      Log('win, 2 wei sent'); // winner AND send didn't fail!
    } else  {
        Log('lose, thanks for playing'); // loser OR sending failed
    }
  }
    
  function bet() payable {
    // we accept just test bets worth 1 Wei :)
    // contract must have some Ether, so deploy with 1 ETH to be sure
    if ((msg.value != 1)||(this.balance < 2)) throw;
    Log("rolling...");
    rollDice();
  }
    
  function rollDice() private {
    bytes32 myid = oraclize_query("WolframAlpha", "random number between 1 and 6");
    bets[myid] = msg.sender;
    Log("...rolled, watch out for callback");
  }
}