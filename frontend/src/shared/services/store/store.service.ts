import { create } from "zustand";
import { StorageKeys } from "@shared/constants/storageKeys.ts";

type Store = {
  accessToken: string | null;
  refreshToken: string | null;

  setTokens: (data: { accessToken: string; refreshToken: string }) => Promise<void>;
  removeTokens: () => void;
};

export const useStore = create<Store>()((set) => ({
  accessToken: localStorage.getItem(StorageKeys.AccessToken),
  refreshToken: localStorage.getItem(StorageKeys.RefreshToken),

  setTokens: async ({ refreshToken, accessToken }) => {
    localStorage.setItem(StorageKeys.AccessToken, accessToken);
    localStorage.setItem(StorageKeys.RefreshToken, refreshToken);

    set((state) => ({ ...state, refreshToken, accessToken }));
  },

  removeTokens: () => {
    localStorage.removeItem(StorageKeys.AccessToken);
    localStorage.removeItem(StorageKeys.RefreshToken);
  },
}));
