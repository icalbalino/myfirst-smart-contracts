import "@nomiclabs/hardhat-ethers";
import { ethers } from "hardhat";

async function deploy(name, ...args) {
    const Fallback = await ethers.getContractFactory(name);
    const fallback = await Fallback.deploy(...args);
    await fallback.deployed();
    
    console.log(fallback.address);

    return fallback;
}

// async function fallback(fallback) {
//     const f = await ethers.getContractAt("IFallback", fallback.address);
//     await f.count();
// }

async function printStroge(contract, name, count) {
    for (let i = 0; i < count; i++) {
        console.log(name, i, await ethers.provider.getStorageAt(contract.address, i));
    }
}

async function fallback() {
    const a = await deploy("A");
    const b = await deploy("B", a.address);

    await printStroge(b, "B", 3);
    // console.log("A", await a.getA());
    // console.log("B", await b.getB());
    // console.log("------------");

    // await a.setA(41);
    // console.log("A", await a.getA());
    // console.log("B", await b.getB());
    // console.log("------------");

    // await b.setB(60);
    // console.log("A", await a.getA());
    // console.log("B", await b.getB());
    // console.log("------------");
}

fallback();
//deploy().then(fallback);
// deploy();


// class Foo {
//     private bar: number;
//     foo() {
//         console.log("foo", this.bar);
//     }
// }

// const foo = new Foo();
// foo.foo();
// foo.foo.call({
//     bar: 42
// })