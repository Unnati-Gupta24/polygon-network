require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.4",
  networks: {
    local: {
      url: "http://localhost:10002",
      accounts: {
        mnemonic: "test test test test test test test test test test test junk"
      }
    }
  }
};
