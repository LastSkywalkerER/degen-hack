import { Contract, Signer, utils } from "ethers";
import { env } from "@shared/config/environment.ts";
import { ultraAbi } from "@shared/services/web3/ultraAbi.ts";
import abi from "./abi.json";

export interface Call {
  target: string;
  callData?: string;
}

export class Multicall {
  public readonly contract;

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

  public async test(signer: Signer) {
    console.log("test", 1);
    const iface = new utils.Interface([
      "function transferFrom(address from, address to, uint amount)",
    ]);

    console.log("test", 2);
    const encodedSupplyData = iface.encodeFunctionData("transferFrom", [
      await signer.getAddress(),
      "0x6C7480731F67f337BfB560e89BEb98DB105bC326",
      1,
    ]);
    console.log("test", 3);

    const supply = {
      target: "0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8",
      callData: encodedSupplyData,
    };
    console.log("test", 5);

    const stable = new Contract("0x94a9D9AC8a22534E3FaCa9F4e7F2E2cf85d5E4C8", ultraAbi, signer);
    await stable.approve(await signer.getAddress(), 1);
    await stable.approve(this.contract.address, 2);

    const tx = await this.contract.aggregate([supply]);
    console.log("test", 7);

    return await tx.wait();
  }
}
