import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const PRIVATE_KEY = "15eb7e6896aa88a02bf1e5d8fa3497d2fb29964c5889955078b0a7448f95b33f";

const config: HardhatUserConfig = {
  solidity: "0.8.9",
  networks: {
    bscTestnet: {
      url: "https://data-seed-prebsc-2-s2.binance.org:8545",
      chainId: 97,
      gasPrice: 20000000000,
      accounts: [`${PRIVATE_KEY}`]
    },
  },
  etherscan: {
    apiKey: {
      bscTestnet: "AQYAZ81VX56BJP7H9V8K9JF3UZMZ8G4ZQQ"
    }
  }
};

export default config;
