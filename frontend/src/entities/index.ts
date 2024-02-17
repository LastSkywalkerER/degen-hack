export interface UIArg {
  name: string;
  id: string;
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
