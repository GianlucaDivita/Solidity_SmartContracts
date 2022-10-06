/* 

SEPT 12 2022


Smart contract to SET and GET an unsigned integer. 


unsigned integer (uint) must be a positive value.


------------------------------------------------------*/ 

// SPDX-License-Identifier: MIT


pragma solidity >=0.4.0 <0.6.0;    


contract SimpleNumStorage {


    // unsigned integer data type , POSITIVE VALUES ONLY , this is a state variable.

    uint storedValue; 


    // 'x' will = a positive number.

    function set(uint x) public {
        storedValue = x;
    }


    // view sets the function to a read-only.

    function get () public view returns (uint) {   
       return storedValue;
    }


}
