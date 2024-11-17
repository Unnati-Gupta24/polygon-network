const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("CustomToken", function () {
    let CustomToken;
    let token;
    let owner;
    let addr1;
    let addr2;

    beforeEach(async function () {
        CustomToken = await ethers.getContractFactory("CustomToken");
        [owner, addr1, addr2] = await ethers.getSigners();
        token = await CustomToken.deploy(ethers.utils.parseEther("1000000"));
        await token.deployed();
    });

    it("Should deploy with correct initial supply", async function () {
        const totalSupply = await token.totalSupply();
        expect(totalSupply).to.equal(ethers.utils.parseEther("1000000"));
    });

    it("Should allow owner to mint tokens", async function () {
        await token.mint(addr1.address, ethers.utils.parseEther("100"));
        const balance = await token.balanceOf(addr1.address);
        expect(balance).to.equal(ethers.utils.parseEther("100"));
    });
});