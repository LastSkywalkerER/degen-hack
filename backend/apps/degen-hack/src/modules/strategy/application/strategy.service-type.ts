export interface AddPublicStrategyParameters {
  title: string;
  steps: StepParameters[];
}

export interface StepParameters {
  id: number;
  title: string;
  address: string;
  func: string;
  data: {
    id: number;
    value: string;
  }[];
}

export interface AddUserStrategyParameters {
  title: string;
  steps: StepParameters[];
  userId: string;
}
