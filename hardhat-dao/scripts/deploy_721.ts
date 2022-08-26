import { ethers } from "hardhat";

async function main() {
  const Simple721 = await ethers.getContractFactory("Simple721");
  const simple721 = await Simple721.deploy();
  await simple721.deployed();
  console.log("Simple721 deployed to: ", simple721.address);  // 0xEBbC111061574E9ec203eC63D741B4d553eBc703
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });