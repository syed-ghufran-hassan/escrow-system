// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Arbiter.sol";

contract Beneficiary {
    address public beneficiary;
    bool public servicesDone;
    address public arbiter;

    modifier onlyBeneficiary() {
        require(msg.sender == beneficiary, "NotAuthorized");
        _;
    }

    event ServicesToggled(bool status);

    constructor(address _arbiter) {
        beneficiary = msg.sender;
        arbiter = _arbiter;
        Arbiter(arbiter).setBeneficiary(address(this)); // Set this contract as a beneficiary in the Arbiter
    }

    function setArbiter(address _arbiter) external {
        arbiter = _arbiter;
        Arbiter(arbiter).setBeneficiary(address(this)); // Update beneficiary in the Arbiter
    }

    function toggleServices() external onlyBeneficiary {
        servicesDone = !servicesDone;
        emit ServicesToggled(servicesDone);
    }
}
