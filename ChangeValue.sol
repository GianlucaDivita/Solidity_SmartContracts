/* 

SEPT 14 2022

This contract is a simple demonstration of how to overwrite a value using modifiers in Solidity.


--------------------------------------------------------*/


// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


contract ChangeValue {

    // declare x as an unsigned integer and assign an initalize value of 10 to it.

    uint x = 10;


    modifier change(uint num) {
        x = num;
        _;
    }

    // Change the value of 'x'.


    function overwriteXValue (uint num) change(num) public returns (uint) {
        num = x;
        return x;
    }

    // View the value of 'x'. 

    function viewValue() public view returns (uint) {
        return x;
    }
}