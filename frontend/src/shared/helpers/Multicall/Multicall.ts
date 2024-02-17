import { Contract, Signer, utils } from "ethers";
import { env } from "@shared/config/environment.ts";
import { ultraAbi } from "@shared/services/web3/ultraAbi.ts";
import abi from "./abi.json";

export interface Call {
  target: string;
  callData?: string;
}

export class Multicall {
  private readonly contract;

  constructor(signer: Signer) {
    this.contract = new Contract(env.MULTICALL_ADDRESS, abi, signer);
  }

  public async tryAggregate(calls: Call[], value = 0, requireSuccess = true) {
    console.log({ calls, value, requireSuccess });

    let tx;

    if (value > 0) {
      tx = await this.contract.tryAggregate(requireSuccess, calls, {
        value: utils.parseEther(String(value)),
      });
    } else {
      tx = await this.contract.tryAggregate(requireSuccess, calls);
    }

    return await tx.wait();
  }

  public async test() {
    console.log("test", 1);
    const iface = new utils.Interface(ultraAbi);
    console.log("test", 2);
    const encodedSupplyData = iface.encodeFunctionData("supply", ["", 1]);
    console.log("test", 3);
    const encodedBorrowData = iface.encodeFunctionData("borrow", [
      "0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8",
      1,
      1,
    ]);
    console.log("test", 4);

    const supply = {
      target: "0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951",
      callData: encodedSupplyData,
    };
    console.log("test", 5);

    const borrow = {
      target: "0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951",
      callData: encodedBorrowData,
    };
    console.log("test", 6);

    const tx = await this.contract.aggregate([supply, borrow]);
    console.log("test", 7);

    return await tx.wait();
  }
}
