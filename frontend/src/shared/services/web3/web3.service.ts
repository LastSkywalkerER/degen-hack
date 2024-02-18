import { create } from "zustand";

import { Signer, utils } from "ethers";
import { BehaviorSubject, filter } from "rxjs";
import { Multicall } from "@shared/helpers/Multicall/Multicall.ts";
import { ultraAbi } from "@shared/services/web3/ultraAbi.ts";
import { UIArg } from "@entities/index.ts";

export interface AggregateArgs {
  to: string;
  value?: number;
  func: string;
  args: UIArg[];
}

export interface Web3Store {
  signer: BehaviorSubject<Signer | null>;

  init: (signer?: Signer) => void;
  tryAggregate: (args: AggregateArgs[]) => Promise<void>;
}

export const useWeb3 = create<Web3Store>()((_, get) => ({
  signer: new BehaviorSubject<Signer | null>(null),

  init: (newSigner) => {
    const { signer } = get();

    newSigner && signer.next(newSigner);
  },

  tryAggregate: async (args) => {
    console.log("tryAggregate", 1);
    const { signer } = get();
    console.log("tryAggregate", { signer });
    signer.pipe(filter((signer) => !!signer)).subscribe(async (currentSigner) => {
      console.log("tryAggregate", { currentSigner: await currentSigner?.getAddress() });
      if (!currentSigner) return;
      console.log("tryAggregate", 4);
      const multicall = new Multicall(currentSigner);
      console.log("tryAggregate", { multicall });

      const reciept = await multicall.tryAggregate(
        await Promise.all(
          args.map(async ({ args, to, value, func }) => {
            console.log({ args, to, value, func });
            const userAddress = await currentSigner.getAddress();

            // const contract = new Contract(to, ultraAbi, currentSigner);
            const iface = new utils.Interface(ultraAbi);
            console.log({ iface });

            const sortedArgs = args
              .sort((a, b) => {
                if (+a.id > +b.id) return 1;
                if (+a.id < +b.id) return -1;
                return 0;
              })
              .map(({ value, type }) => {
                if (type === "userAddress") {
                  return userAddress;
                }

                if (type === "multicallAddress") {
                  return multicall.contract.address;
                }

                return value;
              });

            const data = await iface.encodeFunctionData(func, sortedArgs);

            console.log({
              sortedArgs,
              func,
              target: to,
              callData: data,
              // contractData: await contract.populateTransaction[func](...sortedArgs),
            });

            return {
              target: to,
              callData: data,
            };
          }),
        ),
        args.reduce((acc, { value }) => +acc + +(value || 0), 0),
      );

      console.log({ reciept });
    });
  },
}));
