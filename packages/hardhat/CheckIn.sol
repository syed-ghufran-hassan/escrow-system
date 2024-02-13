// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import "./BatchRegistry.sol";
//import "@openzeppelin/contracts/access/Ownable.sol";
//import "./interfaces/BatchRegistryInterface.sol";
//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";



contract CheckIn {
   BatchRegistry public batchRegistry;

 constructor(address payable _batchRegistry) {
  batchRegistry = BatchRegistry(_batchRegistry);
 }
   
event CheckedIn(address indexed participant);  
    
   

    // Function to check in
    function checkMeIn() public {
       
        batchRegistry.checkIn();

        // Perform additional actions if needed

        // Emit the CheckedIn event
        emit CheckedIn(msg.sender);
    }
    }
