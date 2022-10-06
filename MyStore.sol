/* 

SEPT 15 2022

This smart contract is a simple receipt in which a user inputs three values
and has it returned in an array.

This contract uses a struct to group the data for the receipt.


--------------------------------------------------------*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MyStore{
    struct Receipt {
        uint price;
        uint quantity;
        uint paid;
    }
    Receipt public receipt;
    uint[3] internal myArray;
    function MakeReceipt(uint _price, uint _quantity, uint _paid) public {
        
        myArray[0] = _paid;
        myArray[1] = _price;
        myArray[2] = _quantity;
        
        receipt.paid = myArray[0];
        receipt.price = myArray[1];
        receipt.quantity = myArray[2];

    }

    
}