// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Distribute {
    /*
        This exercise assumes you know how to sending Ether.
        1. This contract has some ether in it, distribute it equally among the
           array of addresses that is passed as argument.
        2. Write your code in the `distributeEther` function.
    */
    event transfered(uint256 amount,address adres);
    constructor() payable {}

    function distributeEther(address[] calldata addresses) public {
        uint256 noOfAddresses = addresses.length;
        uint256 blanceOfContract = address(this).balance;

    uint256 shareToSend = ((blanceOfContract * 10 ** 18)/noOfAddresses)/10 ** 18;


    for(uint256 i=0;i< noOfAddresses;i++){
        payable(addresses[i]).transfer(shareToSend );
        emit transfered(shareToSend, addresses[i]);
    }

    }
}
