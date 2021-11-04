// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;
pragma experimental ABIEncoderV2;



contract ContractZoombi{
    
    address payable private  owner;
    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }
    constructor(address payable _owner){
        owner = _owner;
    }
    
    function getBalance()public view onlyOwner returns(uint256){
        return address(this).balance;
    }
    function getAddress()public view onlyOwner returns(address){
        return address(this);
    }
    
    function getOwner()public view returns(address){
        return owner;
    }

    function kill() public  onlyOwner{
        // address payable addr = payable(address(this));
        selfdestruct( owner ); 
        

    }
    
}


contract A_factoryZombi{
    ContractZoombi[] private contractzoombi;
    address payable private owner;
    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }
    constructor(){
        owner = payable(msg.sender);
    }
    
    function create() public onlyOwner{
        
        ContractZoombi zoombi= new ContractZoombi(payable(address(this)));
        contractzoombi.push(zoombi);
    }
    
    
    function getBalanceContractZoombi(uint _index) public onlyOwner view returns(uint256){
        return contractzoombi[_index].getBalance();
    }
    function getAddressContractZoombi(uint _index) public onlyOwner view returns(address){
        return contractzoombi[_index].getAddress();
    }
    
    function getKillContractZoombi(uint _index) public onlyOwner returns(uint){
        contractzoombi[_index].kill();
        // delete contractzoombi[contractzoombi.length-1];
        return 1;
    }
    
    
}


