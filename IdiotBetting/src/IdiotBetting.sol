// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

error notHighestBidder(address);
error timeLeft(uint256);


contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */

   event Bet(address, uint256 ,uint256);

   uint256 endTime;
   uint256 highestBid ;
   address highestBidder;
 

    function bet() public payable {
        // your code here
        if (msg.value > highestBid ) {
            highestBid = msg.value;
            highestBidder = msg.sender;
            endTime = block.timestamp + 1 hours;
        }

        emit Bet(msg.sender,msg.value,block.timestamp);

    }

    function claimPrize() public {
        if (msg.sender != highestBidder) {
            revert notHighestBidder(msg.sender);
        }else if (block.timestamp < endTime) {
            revert timeLeft(endTime-block.timestamp);
        }else {    
        payable(highestBidder).transfer(address(this).balance);
        }
        
    }
}
