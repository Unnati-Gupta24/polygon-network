require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");
require("hardhat-gas-reporter");
require("solidity-coverage");

module.exports = {
    solidity: {
        version: "0.8.17",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
    networks: {
        local: {
            url: "http://localhost:10002",
            accounts: {
                mnemonic: "test test test test test test test test test test test junk"
            }
        },
        node2: {
            url: "http://localhost:20002",
            accounts: {
                mnemonic: "test test test test test test test test test test test junk"
            }
        }
    },
    gasReporter: {
        enabled: process.env.REPORT_GAS !== undefined,
        currency: "USD"
    }
};