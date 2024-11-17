const { ethers } = require("hardhat");
const { writeFileSync } = require("fs");

async function main() {
    const [sender] = await ethers.getSigners();
    console.log("Starting load test with account:", sender.address);

    const results = [];
    const transactions = 1000;
    const batchSize = 10;

    for (let i = 0; i < transactions; i += batchSize) {
        const batch = [];
        for (let j = 0; j < batchSize; j++) {
            const tx = sender.sendTransaction({
                to: ethers.Wallet.createRandom().address,
                value: ethers.utils.parseEther("0.001")
            });
            batch.push(tx);
        }

        const startTime = Date.now();
        await Promise.all(batch);
        const endTime = Date.now();

        results.push({
            batchNumber: i / batchSize,
            transactionCount: batchSize,
            duration: endTime - startTime
        });
    }

    writeFileSync(
        "./load-test-results.json",
        JSON.stringify(results, null, 2)
    );
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });