pragma solidity >=0.4.22 < 0.6.0;

interface tokenRecipient {
    function recieveApproval{address_from, uint256_value, address_token, bytes calldata _extra}
}

contract TokenERC20 {
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint256 public totalsupply;

    mapping(address => uint256)public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value)
    event approval(address indexed _owner, address indexed _spender, uint256_value)

    event Burn(address indexed from, uint256 value);

    constructor(uint256 initial supply,
        string memory MusicToken
        string memory MUTN 
    ) public {
        totalSupply= initialsSupply*10** uint256(decimals);
        balanceOf[msg.sender]=totalSupply;
        name=MusicToken;
        symbol=MUTN 
    }

    function _transfer (address _from, address _to, uint _value) internal {
        require(_to!=address(0x0));
        require(balanceOf[_from]>=_value);
        require(balanceOf[_to] + _value>= balanceOf[_to]);
        uint previiousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from]-=_value;
        balanceOf[_from]+=_value;
        emit Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previiousBalances);
    }

    function transfer (address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool success) {
         require(value <=allowance[_from][msg.sender]);
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) 

    }public returns(bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if(approve(_spender, value)) {
            spender.recieveApproval(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }
        function burn(uint256 _value) public returns (bool success)
{           require(balanceOf[msg.sender]>= _value);
              balanceOf[msg.sender] -= _value;
               totalsupply -= _value;

     emit Burn(msg.sender, _value);
        return true;

}
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= value);
        require(_value<=allowance[_from][msg.sender]);
        balanceOf[_from] -=_value;
        allowance[_from][msg.sender] -=_value;
        totalSupply-=_value;
        emit Burn(_from, _value);
    return true;
    }
     }