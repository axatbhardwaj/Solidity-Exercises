// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Deployer {
    /*
        This exercise assumes you know how to deploy a contract.
        1. Create an empty contract.
        2. Deploy the contract and return the address in `deployContract` function.
    */

    function deployContract() public view returns (address) {

        bytes memory bytecode = type(EmptyContract).creationCode;
        
        bytes32 hash = keccak256((abi.encodePacked(bytes1(0xff),address(this),block.number,keccak256(bytecode))));
        return address(uint160(uint(hash)));
        
    }
}


contract EmptyContract {

    address public owner;
    uint256 public foo;

    constructor(address _owner, uint256 _foo) payable {
        owner = _owner;
        foo = _foo;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}