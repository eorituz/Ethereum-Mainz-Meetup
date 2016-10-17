//Contract defining to the modifier onlyOwner & allowing to transfer the Ownership
//Needed to whitelist Poll participants
contract owned {
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;                     
        _                                                   //Only the owner ist allowed to call the modified function
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}

// Contract defining the KycToken
// "is owned" means that the functions within the contract KycToken can access the variables owner and the modifier onlyOwner 
contract KycToken is owned{
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    string public name;                                     //Name of the Token
    string public symbol;                                   //Symbol of the Token
    uint8 public decimals;                                  //Decimals

    /* Initializes contract with initial supply tokens to the creator of the contract - Needs to have the same name as the contract!*/
    function KycToken(uint256 initialSupply, string TokenName, uint8 TokenDecimals, string TokenSymbol) {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        name = TokenName;                                   
        decimals = TokenDecimals;
        symbol = TokenSymbol;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        //Start additional queries
        if (frozenAccount[msg.sender]) throw;
        if (!whitelistedAccount[msg.sender]) throw;
        //End additional queries
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   //Send the 'Event' Transfer to the network
    }
    
    
////////////////////////////////////////////////Additional functions////////////////////////////////////////////////

// Freezing an account
mapping (address => bool) public frozenAccount;
event FrozenFunds(address target, bool frozen);

function freezeAccount(address target, bool freeze) onlyOwner {
    frozenAccount[target] = freeze;
    FrozenFunds(target, freeze);
}

// Whitelisting an account
mapping (address => bool) public whitelistedAccount;
event WhitelistedAddress(address target, bool approved);

function whitelistAccount(address target, bool whitelisted) onlyOwner {
    whitelistedAccount[target] = whitelisted;
    WhitelistedAddress(target, whitelisted);
}

}
