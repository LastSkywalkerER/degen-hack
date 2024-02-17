/* eslint-disable no-console */
import { run } from "hardhat";
import { config } from "dotenv";
import { ethers, upgrades } from "hardhat";

import { Multicall3, TokenFactory, TOK } from "../typechain-types";
import { usdcAddress } from "../constants";

config();

async function main() {
    const [owner] = await ethers.getSigners();

    // const Multicall = await ethers.getContractFactory("Multicall3");
    // const multicall = (await upgrades.deployProxy(Multicall, [
    // ])) as Multicall3;
    // await multicall.deployed();
    // console.log("Multicall ", multicall.address);

    const TokenFactory = await ethers.getContractFactory("TokenFactory");
    const tokenFactory = (await upgrades.deployProxy(TokenFactory, [
    ])) as TokenFactory;
    await tokenFactory.deployed();
    console.log("Factory ", tokenFactory.address);

    await verify(await tokenFactory.tokenImplementation(), []);
    await verify(await tokenFactory.allowedListImplementation(), []);

    const TOK = await ethers.getContractFactory("TOK");
    const tok = (await upgrades.deployProxy(TOK, [
        usdcAddress
    ])) as TOK;
    await tok.deployed();
    console.log("TOK ", tok.address);

    // const Multicall = await ethers.getContractFactory("Multicall3");
    // const multicall = (await upgrades.deployProxy(Multicall, [
    // ])) as Multicall3;
    // await multicall.deployed();
    // console.log("Multicall ", multicall.address);
}

const delay = async (milliseconds: number) =>
    await new Promise((resolve) => setTimeout(resolve, milliseconds));

export const verify = async (address: string, args: any) => {
    console.log(`Waiting before verify contract ${address}`);
    await delay(10000);

    console.log(`Verifying contract ${address}`);
    try {
        await run("verify:verify", {
            address,
            constructorArguments: args,
        });
    } catch (error: any) {
        if (error.message.toLowerCase().includes("already verified")) {
            console.log("Already verified");
        } else {
            console.error(error);
        }
    }
};

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
