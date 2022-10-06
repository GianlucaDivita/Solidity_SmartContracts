/*

SEPT 13 2022

This is a simple calculator smart contract with:

* Addition
* Subtraction
* Multiplication
* Division

Of whole numbers.


-----------------------------------------------------*/



// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Calculator {

    function add (uint a, uint b) public pure returns (uint) {
        uint c = a + b;
        require (c >= a, "ADD-VARIABLE-OVERFLOW");
        return c;
    }

    function subtract(uint a, uint b) public pure returns (uint) {
        uint c = a - b;
        require (b <= a, "SUBTRACT-VARIABLE-UNDERFLOW");
        return c;
    }

    // Division here is not perfect, answer will be rounded to a whole number. 

    function division( uint a, uint b) public pure returns (uint) {     
    require  (b > 0, "CANNOT-DIVIDE-BY-ZERO");
    uint c = a / b;
    return c;

    }

    function multiplication (uint a, uint b) public pure returns (uint) {
        uint c = a * b;
        return c;
    }

    
}