pragma solidity >=0.4.22 <0.9.0;

contract ERC20Token {
    string public constant name = "ERC20Basic";
    string public constant symbol = "BSC";
    uint8 public constant decimals = 18;

    event Transfer(address from, address to, uint256 amount);
    event Approval(address from, address to, uint256 amount);
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    uint256 _totalSupply;
   constructor(uint256 total) public {  
	_totalSupply = total;
	balances[msg.sender] = _totalSupply;
    }  
    function transfer(
        address from,
        address to,
        uint256 amount
    ) public {
        balances[from] = balances[from] - amount;
        balances[to] = balances[to] + amount;
        emit Transfer(from, to, amount);
    }

    function approve(address delegate, uint256 numTokens)
        public
        returns (bool)
    {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate)
        public
        view
        returns (uint256)
    {
        return allowed[owner][delegate];
    }

    function transferFrom(
        address owner,
        address buyer,
        uint256 numTokens
    ) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner] - (numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender] - (numTokens);
        balances[buyer] = balances[buyer] + (numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }

    function balanceOf(address Address) public view returns (uint256) {
        return balances[Address];
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
}
