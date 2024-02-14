// deploy.ts
import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";

const deployYourContract: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployer } = await hre.getNamedAccounts();
  const { deploy } = hre.deployments;
 // "0xdd028fAd9098570Bb6a7394A71430311175173B6"

  // Deploy Arbiter contract
  //const ArbiterDeployment = await deploy("Arbiter", {
  //  from: deployer,
  //  args: [deployer],
  //  log: true,
  //  gasLimit: 5000000,
 // });

 //const ArbiterAddress = ArbiterDeployment.address; 


  // Deploy Escrow contract
 await deploy("Beneficiary", {
   from: deployer,
   args: ["0xdd028fAd9098570Bb6a7394A71430311175173B6"],
    log: true,
    autoMine: true,
   // gasLimit: 5000000,
  });
};

export default deployYourContract;
deployYourContract.tags = ["Beneficiary"];

//deploy.tags = ["Arbiter", "Escrow"];
