const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("CheckIn contract", function () {
  it("should check in successfully", async function () {
    // Deploy the BatchRegistry contract
    const BatchRegistry = await ethers.getContractFactory("BatchRegistry");
    const batchRegistry = await BatchRegistry.deploy(/* constructor arguments */);
    await batchRegistry.deployed();

    // Deploy the CheckIn contract and pass the BatchRegistry address
    const CheckIn = await ethers.getContractFactory("CheckIn");
    const checkInContract = await CheckIn.deploy(batchRegistry.address);
    await checkInContract.deployed();

    // Perform the check-in transaction
    const checkInTransaction = await checkInContract.checkMeIn();

    // Retrieve the logs emitted during the transaction
    const logs = checkInTransaction.logs;

    // Inspect the logs
    for (const log of logs) {
      console.log("Event:", log.event);
      console.log("Arguments:", log.args);
    }

    // Add your assertions or expectations
    // For example, expect(logs[0].event).to.equal("CheckedIn");

    // You can also perform additional checks based on the state of BatchRegistry, if needed
    const checkedInCounter = await batchRegistry.getCheckedInCounter();
    expect(checkedInCounter).to.equal(1); // Assuming the counter is incremented when checking in
  });
});
