import { StrategyEntity } from '../infrastructure';

export interface CreateStrategyParameters {
  title: string;
  userId?: string;
  isPublic: boolean;
  isActive?: boolean;
}

export interface CreateStepParameters {
  id: number;
  title: string;
  address: string;
  func: string;
  data: string;
  strategy: StrategyEntity;
}
