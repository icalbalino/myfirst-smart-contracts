import "@nomiclabs/hardhat-ethers";
import { ethers } from "hardhat";

async function deploy() {
    const HelloWorld = await ethers.getContractFactory("MyContract"); // the name your contract, not the name your file that contains the cotract
    const hello = await HelloWorld.deploy();
    await hello.deployed();

    return hello;
}

// @ts-ignore
async function sayHello(hello) {
    console.log("Say Hello:", await hello.firstContract());
}

deploy().then(sayHello);