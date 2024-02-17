import { create } from "zustand";

import { Contract, Signer, utils } from "ethers";
import { BehaviorSubject, filter } from "rxjs";
import { Multicall } from "@shared/helpers/Multicall/Multicall.ts";
import { ultraAbi } from "@shared/services/web3/ultraAbi.ts";
import { MultiInputProps } from "@pages/BuildStrategy/BuildStrategy.tsx";

export interface AggregateArgs {
  to: string;
  value?: number;
  func: string;
  args: MultiInputProps[];
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

      // return await multicall.test();

      const reciept = await multicall.tryAggregate(
        await Promise.all(
          args.map(async ({ args, to, value, func }) => {
            console.log({ args, to, value, func });

            const contract = new Contract(to, ultraAbi, currentSigner);
            const iface = new utils.Interface(ultraAbi);
            console.log({ iface });

            const sortedArgs = args
              .sort((a, b) => {
                if (+a.id > +b.id) return 1;
                if (+a.id < +b.id) return -1;
                return 0;
              })
              .map(({ value }) => value);

            const data = await iface.encodeFunctionData(func, sortedArgs);

            console.log({
              sortedArgs,
              func,
              target: to,
              callData: data,
              contractData: await contract.populateTransaction[func](...sortedArgs),
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
