// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Deployer {
    /*
        This exercise assumes you know how to deploy a contract.
        1. Create an empty contract.
        2. Deploy the contract and return the address in `deployContract` function.
    */

    function deployContract() public returns (address) {
        // your code here
        EmptyContract newInstance = new EmptyContract();
        address newAddress= address(newInstance);

        return newAddress;
    }
}


contract EmptyContract {
    address public owner;
    uint256 public foo;

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}