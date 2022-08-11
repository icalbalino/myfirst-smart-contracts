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
        const Hero = await ethers.getContractFactory("TestHero"); //deploy contract
        const hero = await Hero.deploy(); //it's gonna make the transaction that actually puts a contract on to an ethereum network.
        await hero.deployed();

        return hero;
    }

    let hero;

    before(async function () {
        hero = await createHero();
    });

    it("should get a zero hero array", async function() {
        // expect(await hero.getHeroes().length).to.equal(0);
        expect(await hero.getHeroes()).to.deep.equal([]);
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

    it("shouldn't fail at creating hero cause of payment", async function () {
        const hero = await createHero();
        await hero.setRandom(69);
        await hero.createHero(0, {
            value: ethers.utils.parseEther("0.05")
        });
        
        const h = (await hero.getHeroes())[0];

        // [ S, H, D, I, M ]
        // [ S, H, D, I ]
        // [ S, I, D ]
        expect(await hero.getMagic(h)).to.equal(16);
        expect(await hero.getHealth(h)).to.equal(2);
    });
});