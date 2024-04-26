// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

error NoEtherSent();
error NotEnoughBalance(uint256);

contract BasicBank {
    /// @notice deposit ether into the contract
    /// @dev it should work properly when called multiple times

    mapping (address => uint) balanceBook;

    function addEther() external payable {
        if(msg.value <= 0)
        {
            revert NoEtherSent();
        }

        balanceBook[msg.sender]=msg.value;

    }
    /// @notice used to withdraw ether from the contract (No restriction on withdrawals)
    function removeEther(uint256 amount) external payable {
        
        if(balanceBook[msg.sender]<amount)
        {
            revert NotEnoughBalance(balanceBook[msg.sender]);
        }
        balanceBook[msg.sender]-=amount;
        payable(msg.sender).transfer(amount);
    }
}
