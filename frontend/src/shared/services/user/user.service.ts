import { create } from "zustand";
import { jwtDecode } from "jwt-decode";

import { filter } from "rxjs";
import { useStore } from "@shared/services/store/store.service.ts";
import { LoggedUser, UserData } from "@entities/Users";
import { Users } from "@shared/api/Users/Users.ts";
import { useWallet } from "@shared/services/wallet/wallet.service.ts";
import { Auth } from "@shared/api/auth/Auth.ts";

type UserStore = {
  user?: LoggedUser;
  useData?: UserData;

  login: () => Promise<void>;
  logout: () => Promise<void>;
  refresh: () => Promise<void>;
  getActiveUser: () => Promise<void>;
};

const initUser = () => {
  const accessToken = useStore.getState().accessToken;

  if (accessToken) {
    return jwtDecode<LoggedUser>(accessToken);
  }

  return undefined;
};

export const useUser = create<UserStore>()((set, get) => ({
  user: initUser(),
  userData: null,

  getActiveUser: async () => {
    const { user } = get();

    const userData = user && (await Users.getUser()).data;

    if (!userData) return;

    set((state) => ({
      ...state,
      userData,
    }));
  },

  login: async () => {
    const { getActiveUser } = get();
    const { signer } = useWallet.getState();
    const { setTokens } = useStore.getState();

    signer.pipe(filter((signer) => !!signer)).subscribe(async (signer) => {
      if (!signer) return;

      const {
        data: { message },
      } = await Auth.getMessage(await signer.getAddress());
      const signature = await signer.signMessage(message);

      if (!signature) return;
      const { data } = await Auth.verifySignature(await signer.getAddress(), signature);

      await setTokens(data);

      const user = jwtDecode<LoggedUser>(data.accessToken);

      set((state) => ({
        ...state,
        user,
      }));

      await getActiveUser();
    });
  },

  logout: async () => {
    const { removeTokens } = useStore.getState();

    removeTokens();
    set((state) => ({ ...state, user: undefined, userData: null }));
  },

  refresh: async () => {
    const { setTokens, refreshToken } = useStore.getState();

    if (!refreshToken) return;

    const { data } = await Auth.refresh(refreshToken);

    setTokens(data);
  },
}));
