// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Escrow.sol";

contract Arbiter is Ownable{
    address public arbiter;
   // address public owner;
  // address public deployer;

    modifier onlyArbiter() {
        require(msg.sender == arbiter, "NotAuthorized");
        _;
    }

    constructor(address _deployer) onlyOwner{
        arbiter = _deployer;
    }



    function approvePayment(address _escrow, bool _servicesDone) external onlyArbiter {
        require(Escrow(_escrow).getBeneficiary() == msg.sender, "InvalidBeneficiary");
        require(_servicesDone, "ServicesNotDone");
        
        Escrow(_escrow).transferToBeneficiary();
    }
}
