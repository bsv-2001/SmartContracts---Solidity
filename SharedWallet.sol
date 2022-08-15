//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.1/contracts/math/SafeMath.sol";
contract wallet {
    using SafeMath for uint;
    address payable owner;
    address[] public addresses;
    mapping(address => uint) public allowance;
    mapping(address => bool) public isAdded;
    event Moneysent(address indexed _whom , uint amount , string msgResponse);
    event Allocated(address indexed _whom , uint amount , string msgResponse);
   
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender,"Permission denied.");
        _;
    }

    modifier checkAllowance(address _to, uint _amount){
        require( allowance[_to] >= _amount,"Insufficient funds" );
        _;
    }

    function addAllowance(address _to, uint _amount) public onlyOwner {
        allowance[_to]=allowance[_to].add(_amount);
        if(isAdded[_to]==false){
        isAdded[_to]=true;
        addresses.push(_to);
        }    
        emit Allocated(_to,_amount,"add allowance");                            
    }

    function deductAllowance(address _to, uint _amount) public onlyOwner{
        allowance[_to]=allowance[_to].sub(_amount);
    }

    function withdrawOwner(uint _amount) public{
        uint count=0;
        uint avg=0;
        for(uint i=0;i<addresses.length;i++)
            if(allowance[addresses[i]]!=0)
                 count++;
        if(count!=0)
            avg=getContract_Current_Balance()/count;
        for(uint i=0;i<addresses.length;i++)
            if(allowance[addresses[i]]!=0)
                allowance[addresses[i]]=allowance[addresses[i]].sub(avg);
        require(getContract_Current_Balance()>=_amount,"Insufficient funds");
        owner.transfer(_amount);

    }


    function From_Acc_to_SCA() public payable {
    
    }

    function From_SCA_to_Acc(address payable _to, uint _amount) public checkAllowance(_to,_amount){
        _to.transfer(_amount); 
        allowance[_to]=allowance[_to].sub(_amount);
        emit Moneysent(_to,_amount,"from sca to acc");

    } 

    function getContract_Current_Balance() public view returns(uint){
        return address(this).balance;
    }

    function destroySmartContract() public{
        selfdestruct(owner);
    }

    

}