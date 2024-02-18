import { create } from "zustand";
import { ReqAddUserStrategy, UIStep, UIStrategy } from "@entities/index.ts";
import { Startegy } from "@shared/api/Strategy/Strategy";

type StrategyStore = {
  title?: string;
  steps: UIStep[];
  publicSteps: UIStep[];
  userStrategies: UIStrategy[];
  publicStrategies: UIStrategy[];

  setTitle: (name: string) => void;
  selectStep: (step: UIStep) => void;
  getAllSteps: () => Promise<void>;
  addUserStrategy: (data: ReqAddUserStrategy) => Promise<void>;
  getCurrentUserStrategies: () => Promise<void>;
  getPublicStrategies: () => Promise<void>;
  addPublicStrategy: (data: ReqAddUserStrategy) => Promise<void>;
};

export const useStrategy = create<StrategyStore>()((set) => ({
  title: "Hello world",
  steps: [],
  publicSteps: [],
  userStrategies: [],
  publicStrategies: [],

  setTitle: (name) => {
    set((state) => ({ ...state, title: name }));
  },
  selectStep: (step) => {
    set((state) => ({ ...state, steps: [...state.steps, step] }));
  },
  getAllSteps: async () => {
    const steps = (await Startegy.getPublicSteps()).data;

    const parsedArray = steps.map((obj) => ({
      ...obj,
      args: JSON.parse(obj.data),
    }));

    set({ publicSteps: parsedArray.sort((a, b) => a.id - b.id) });
  },
  addUserStrategy: async (data: ReqAddUserStrategy) => {
    await Startegy.addUserStrategy(data);
  },
  getCurrentUserStrategies: async () => {
    const strategies = (await Startegy.getCurrentUserStrategies()).data;
    console.log(strategies);

    set({ userStrategies: strategies });
  },
  getPublicStrategies: async () => {
    const strategies = (await Startegy.getPublicStrategies()).data;
    console.log(strategies);

    set({ publicStrategies: strategies });
  },
  addPublicStrategy: async (data: ReqAddUserStrategy) => {
    await Startegy.addPublicStrategy(data);
  },
}));
