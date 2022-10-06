/* 

SEPT 14 2022

This contract is an escrow smart contract in which two users (a buyer and a seller)
can exchange value through the smart contract.

The contract uses enums to check the state of the transaction process.


--------------------------------------------------------*/



// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract Escrow {

    // Indicates the current state of the transaction

    // 0th value: AWAITING_PAYMENT - Requires state change by buyer
    // 1st value: AWAITING_DELIVERY - Requires state change by seller
    // 2nd value: COMPLETE - will return complete when both buyer & seller have performed their actions.
    

    enum state {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE}

    // Variable to hold the state

    state public currentState;

    // buyer address

    address public buyer;

    // seller address, use 'payable' to allow address to receive money. 

    address payable public seller;

    // Ensures that only the buyer can call functions the modifier is attached to

    modifier onlyBuyer() {
        require(msg.sender == buyer, "only the buyer can call this function!" );
        _;
    }

    // Ensures that only the seller can call functions the modifier is attached to

        modifier onlySeller() {
        require(msg.sender == seller, "only the seller can call this function!" );
        _;
    }

    // Set up the buyer and seller addresses

    constructor(address _buyer, address payable _seller) public {
        buyer = _buyer;
        seller = _seller;
    }


    // The buyer calls this function to deposit Ether to the contract 

    function deposit() onlyBuyer external payable {
        require(currentState == state.AWAITING_PAYMENT, "Buyer has already paid");
        currentState = state.AWAITING_DELIVERY;
    }


    // The buyer calls this function to confirm that they have received the item for sale

    function confirmDelivery() onlySeller external {
        require(currentState == state.AWAITING_DELIVERY, "Cannot confirm delivery");


    // address(this).balance = the balance on THIS smart contract. 

        seller.transfer(address(this).balance);
        currentState = state.COMPLETE;
    }

}