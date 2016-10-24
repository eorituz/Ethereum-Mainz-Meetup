pragma solidity ^0.4.2;

contract Blockchat {
 
 mapping (address => string) private mailbox;

 event Mailed(address from, string message);
 event Read(address from, string message);

 function mail(address receiver, string message) {
   if (bytes(mailbox[receiver]).length > 0) {
     throw;
   }
   mailbox[receiver] = message;
   Mailed(receiver, message);
 }

 function read() returns (string message) {
   message = mailbox[msg.sender];
   Read(msg.sender, message);
   mailbox[msg.sender]="";
   return message;
 }
}