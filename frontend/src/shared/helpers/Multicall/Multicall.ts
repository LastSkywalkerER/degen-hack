import { Contract, Signer } from "ethers";
import { env } from "@shared/config/environment.ts";
import abi from "./abi.json";

export interface Call {
  target: string;
  callData: string;
}

export class Multicall {
  private readonly contract;

  constructor(signer: Signer) {
    this.contract = new Contract(env.MULTICALL_ADDRESS, abi, signer);
  }

  public async tryAggregate(calls: Call[], requireSuccess = true) {
    const tx = await this.contract.tryAggregate(requireSuccess, calls);

    return await tx.wait();
  }
}
