import { create } from "zustand";

import { Signer } from "ethers";
import { BehaviorSubject } from "rxjs";

type WalletStore = {
  signer: BehaviorSubject<Signer | null>;

  init: (signer?: Signer) => void;
};

export const useWallet = create<WalletStore>()((_, get) => ({
  signer: new BehaviorSubject<Signer | null>(null),

  init: (newSigner) => {
    const { signer } = get();

    newSigner && signer.next(newSigner);
  },
}));
