/* eslint-disable no-console */
import { run } from "hardhat";
import { config } from "dotenv";
import { ethers, upgrades } from "hardhat";

import { Multicall3 } from "../typechain-types";

config();

const pricePerToken = ethers.utils.parseUnits("0.015", 6);
const totalSupply = ethers.utils.parseUnits("15000000000", 6);

async function main() {
    const [owner] = await ethers.getSigners();

    const Multicall = await ethers.getContractFactory("Multicall3");
    const multicall = (await upgrades.deployProxy(Multicall, [
    ])) as Multicall3;
    await multicall.deployed();
    console.log(multicall.address);
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
