import "@nomiclabs/hardhat-ethers";

import { ethers } from "hardhat";
import { expect } from "chai";

describe("Hello World", () => {
    it("should get the hello world", async () => {
        const HW = await ethers.getContractFactory("MyContract"); //deploy contract
        const hello = await HW.deploy(); //it's gonna make the transaction thatactually puts a contract on to an ethereum network.
        // await hello.deployed();

        expect(await hello.firstContract()).to.equal("Hello, World");
    });
});