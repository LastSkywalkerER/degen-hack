import { create } from "zustand";
import { UIStep } from "@entities/index.ts";

type StrategyStore = {
  title?: string;
  steps: UIStep[];

  setTitle: (name: string) => void;
  selectStep: (step: UIStep) => void;
};

export const useStrategy = create<StrategyStore>()((set) => ({
  title: "Hello world",
  steps: [],

  setTitle: (name) => {
    set((state) => ({ ...state, title: name }));
  },
  selectStep: (step) => {
    set((state) => ({ ...state, steps: [...state.steps, step] }));
  },
}));
