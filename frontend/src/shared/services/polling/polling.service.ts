import { create } from "zustand";

type PollingStore = {
  queue: Record<string, () => Promise<unknown>>;
  isInitialized: boolean;

  init: (delay?: number, isInternal?: boolean) => void;
  poll: (key: string, callback: () => Promise<unknown>) => void;
  pollWithExecute: <T>(key: string, callback: () => Promise<T>) => Promise<T>;
  unPoll: (key: string) => void;
};

export const usePolling = create<PollingStore>()((set, get) => ({
  queue: {},
  isInitialized: false,

  init: (delay = 5000, isInternal) => {
    const { isInitialized } = get();
    if (isInitialized && !isInternal) return;

    setTimeout(async () => {
      const { queue, init } = get();

      await Promise.all(Object.values(queue).map(async (func) => await func()));

      init(delay, true);
    }, delay);

    set((state) => ({ ...state, isInitialized: true }));
  },

  poll: (key, callback) => {
    set((state) => ({ ...state, queue: { ...state.queue, [key]: callback } }));
  },

  pollWithExecute: async (key, callback) => {
    const { poll } = get();

    poll(key, callback);

    return await callback();
  },

  unPoll: (key) => {
    const { queue } = get();

    const newObject = { ...queue };
    delete newObject[key];

    set((state) => ({ ...state, queue: newObject }));
  },
}));
