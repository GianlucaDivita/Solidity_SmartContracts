/*

SEPT 12 2022

This smart contract is a simple subscription plan which contains the following:

* A base monthly cost set by the deployer account / subscription provider.
* A payment functon for the user account to deposit value in the smart contract.
* A withdraw function to retrieve the value. Restricted in access to anyone except the subscription provider.
* A function to check if the expected value is held within the contract (If false, someone owes money).


------------------------------------------------------*/ 


// SPDX-License-Identifier: MIT


pragma solidity >=0.4.22 < 0.7.0;

contract SubscriptionPlan {


    // Set state variable --> the monthly cost of the cell phone contract.

    uint monthlyCost;
    address owner;


    // Constructor executes upon contract initilization AND ONLY ONCE.

    // The 'uint cost' parameter will have to be filled when deploying the contract. 
    // The value sent in the constructor will be measured in Wei by default. 
    // That same value will also determine the monthly cost that is expected from the user.


    constructor (uint cost) public {      
        monthlyCost = cost;
        owner = msg.sender;
    }

    modifier onlyOwner {
    require(msg.sender == owner);
      _;
    }

    modifier notOwner {
        require(msg.sender != owner);
        _;
    }

    // Send value to the smart contract.


    function makePayment () payable notOwner public {}

    // Transfer the balance from the smart contract to the caller of the function. 

    function withdrawBalance () public onlyOwner {
        msg.sender.transfer(address(this).balance);     
    }

    // Check if payments are up to date then the smart contract balance will hold the full amount necessary.

    // This function will return TRUE if: the monthly cost (uint cost) *multiplied* with the months elapsed
    // equals the value held in the smart contract. 

    function isBalanceCorrect(uint monthsElasped) public view returns (bool) {
        return monthlyCost * monthsElasped == address(this).balance;
    }
 

}