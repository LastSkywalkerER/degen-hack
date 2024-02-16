import { create } from "zustand";
import { jwtDecode } from "jwt-decode";

import { useStore } from "@shared/services/store/store.service.ts";
import { LoggedUser } from "@entities/Users";
import { Users } from "@shared/api/users/Users";

import { roleFeatures, UserFeatures } from "@shared/constants/roleFeatures.ts";

type UserStore = {
  user?: LoggedUser;
  permissions?: Record<UserFeatures, boolean>;

  login: () => Promise<void>;
  logout: () => void;
  getActiveUser: () => Promise<void>;
  isHavePermission: (permissions: UserFeatures[]) => boolean;
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

    const userData = user && (await Users.getUser(user.userId)).data;

    if (!userData) return;

    set((state) => ({
      ...state,
      // permissions: state.user
      //   ? roleFeatures[state.user.role as Roles].reduce<Record<UserFeatures, boolean>>(
      //       (acc, permission) => ({ ...acc, [permission]: true }),
      //       {} as Record<UserFeatures, boolean>,
      //     )
      //   : undefined,
    }));
  },

  login: async () => {
    const { setTokens } = useStore.getState();
    const { getActiveUser } = get();

    // if (!account?.address) return;
    //
    // const {
    //   data: { nonce },
    // } = await Auth.getMessage(account?.address);
    // const signature = await signMessage(nonce);

    // if (!signature) return;
    // const { data } = await Auth.verifySignature(account?.address, signature);
    //
    // await setTokens(data);
    //
    // const user = jwtDecode<LoggedUser>(data.accessToken);
    //
    // set((state) => ({
    //   ...state,
    //   user,
    // }));

    await getActiveUser();
  },

  logout: () => {
    const { removeTokens } = useStore.getState();

    removeTokens();
    set((state) => ({ ...state, user: undefined, userData: null }));
  },

  isHavePermission: (permissions) => {
    const { user } = get();

    return user?.role
      ? permissions.length > 0
        ? permissions.every((permission) => roleFeatures[user.role].includes(permission))
        : true
      : false;
  },
}));
