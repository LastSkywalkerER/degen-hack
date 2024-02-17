import { Injectable } from '@nestjs/common';
import { NotFoundException } from 'degen-hack/exceptions';

import { UserDomain } from '../../user/domain';
import { StrategyDomain } from '../domain';

import {
  AddPublicStrategyParameters,
  AddUserStrategyParameters,
} from './strategy.service-type';

@Injectable()
export class StrategyService {
  constructor(
    private readonly strategyDomain: StrategyDomain,
    private readonly userDomain: UserDomain,
  ) {}

  public async addPublicStrategy(params: AddPublicStrategyParameters) {
    const strategy = await this.strategyDomain.createStrategy({
      title: params.title,
      isPublic: true,
    });

    for (const step of params.steps) {
      await this.strategyDomain.createStep({
        address: step.address,
        data: JSON.stringify(step.data),
        func: step.func,
        id: step.id,
        strategy,
        title: step.title,
      });
    }

    const data = await this.strategyDomain.getStrategyById(strategy.id);

    return data;
  }

  public async addUserStrategy(params: AddUserStrategyParameters) {
    const strategy = await this.strategyDomain.createStrategy({
      title: params.title,
      isPublic: false,
      userId: params.userId,
      isActive: true,
    });

    for (const step of params.steps) {
      await this.strategyDomain.createStep({
        address: step.address,
        data: JSON.stringify(step.data),
        func: step.func,
        id: step.id,
        strategy,
        title: step.title,
      });
    }

    const data = await this.strategyDomain.getStrategyById(strategy.id);

    return data;
  }

  public async getStrategyById(id: number) {
    const data = await this.strategyDomain.getStrategyById(id);

    if (!data) {
      throw new NotFoundException('Strategy not found');
    }

    return data;
  }

  public async getStepById(id: number) {
    const data = await this.strategyDomain.getStepById(id);

    if (!data) {
      throw new NotFoundException('Step not found');
    }

    return data;
  }

  public async getCurrentUserStrategies(userId: string) {
    const data = await this.strategyDomain.getCurrentUserStrategies(userId);

    if (!data) {
      throw new NotFoundException('Strategies not found');
    }

    return data;
  }

  public async getAllSteps() {
    const data = await this.strategyDomain.getAllSteps();

    if (!data) {
      throw new NotFoundException('Steps not found');
    }

    return data;
  }

  public async getPublicStrategies() {
    const data = await this.strategyDomain.getPublicStrategies();

    if (!data) {
      throw new NotFoundException('Strategies not found');
    }

    return data;
  }
}
