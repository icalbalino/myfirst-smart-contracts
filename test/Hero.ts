import "@nomiclabs/hardhat-ethers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Hero", () => {
    // it("Test", async () => {
    //     const Hero = await ethers.getContractFactory("Hero"); //deploy contract
    //     const hero = await Hero.deploy(); //it's gonna make the transaction thatactually puts a contract on to an ethereum network.
    //     // await gas.deployed();

    // });

    async function createHero() {
        const Hero = await ethers.getContractFactory("Heros"); //deploy contract
        const hero = await Hero.deploy(); //it's gonna make the transaction that actually puts a contract on to an ethereum network.
        await hero.deployed();

        return hero;
    }

    let hero;

    before(async function () {
        hero = await createHero();
    });

    it("should fail at creating hero cause of payment", async function () {
        let e;

        try {
            await hero.createHero(0, {
                value: ethers.utils.parseEther("0.049999999") 
            });
        } catch (error) {
            e = error;
        }

        expect(e.message.includes("Please send more money")).to.equal(true);
    });
});