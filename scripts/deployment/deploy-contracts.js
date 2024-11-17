const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with account:", deployer.address);

    const CustomToken = await ethers.getContractFactory("CustomToken");
    const maxSupply = ethers.utils.parseEther("1000000");
    const token = await CustomToken.deploy(maxSupply);
    await token.deployed();

    console.log("Token deployed to:", token.address);
    console.log("Max supply:", ethers.utils.formatEther(maxSupply));

    // Verify contract on block explorer (if applicable)
    if (network.name !== "hardhat") {
        await hre.run("verify:verify", {
            address: token.address,
            constructorArguments: [maxSupply],
        });
    }
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });