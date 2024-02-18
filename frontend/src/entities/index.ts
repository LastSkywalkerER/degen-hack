export interface UIArg {
  name: string;
  id: number;
  type: "userValue" | "const" | "userAddress" | "multicallAddress";
  value: string;
}

export interface UIStep {
  id: number;
  title: string;
  address: string;
  func: string;
  icon: string;
  args: UIArg[];
  isPublic: boolean;
  serialNumber: string;
}

export interface UIStrategy {
  title: string;
  steps: ResStep[];
}

export interface IStrategyCard {
  title: string;
  steps: ResStep[];
  isPublic: boolean;
}

export interface ResStep {
  id: number;
  title: string;
  address: string;
  func: string;
  icon: string;
  data: string;
  isPublic: boolean;
  serialNumber: string;
}

export interface ReqAddUserStrategy {
  title: string;
  steps: {
    id: number;
    address: string;
    title: string;
    func: string;
    data: UIArg[];
  }[];
}
