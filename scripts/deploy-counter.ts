import "@nomiclabs/hardhat-ethers";
import { ethers } from "hardhat";

async function deploy() {
    const C = await ethers.getContractFactory("Counter");
    const counter = await C.deploy();
    console.log(await counter.count());
}

deploy();