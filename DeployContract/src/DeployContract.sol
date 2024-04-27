// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Deployer {
    /*
        This exercise assumes you know how to deploy a contract.
        1. Create an empty contract.
        2. Deploy the contract and return the address in `deployContract` function.
    */







    // function deployContract() public returns (address) {
    //     // your code here
    //     EmptyContract newInstance = new EmptyContract();
    //     address newAddress= address(newInstance);

    //     return newAddress;
    // }




    //using create2
    function deployContract() public returns (address)
    {   
        uint256 _salt = block.number;
        bytes memory byteCode = type(EmptyContract).creationCode;
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff),address(this),_salt,keccak256(byteCode)));
        
        deploy(byteCode, _salt);

        // NOTE: cast last 20 bytes of hash to address
        return address(uint160(uint256(hash)));
    }
    }

    function deploy(bytes memory bytecode, uint256 _salt){
        address addr;
                assembly {
            addr :=
                create2(
                    callvalue(), // wei sent with current call
                    // Actual code starts after skipping the first 32 bytes
                    add(bytecode, 0x20),
                    mload(bytecode), // Load the size of code contained in the first 32 bytes
                    _salt // Salt from function arguments
                )

            if iszero(extcodesize(addr)) { revert(0, 0) }
        }

    }


contract EmptyContract {
    address public owner;
    uint256 public foo;

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}