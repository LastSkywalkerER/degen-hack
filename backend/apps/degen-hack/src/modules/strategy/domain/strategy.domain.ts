import { Injectable } from '@nestjs/common';

import { StrategyRepository, StrategyStepRepository } from '../infrastructure';

import {
  CreateStepParameters,
  CreateStrategyParameters,
} from './strategy.domain-type';

@Injectable()
export class StrategyDomain {
  constructor(
    private readonly strategyRepository: StrategyRepository,
    private readonly strategyStepRepository: StrategyStepRepository,
  ) {}
  public async createStrategy(data: CreateStrategyParameters) {
    const entity = this.strategyRepository.create(data);
    await this.strategyRepository.save(entity);
    return entity;
  }

  public async createStep({
    address,
    data,
    func,
    id,
    title,
    strategy,
  }: CreateStepParameters) {
    const entity = this.strategyStepRepository.create({
      address,
      data,
      func,
      serialNumber: id,
      strategy,
      title,
    });
    await this.strategyStepRepository.save(entity);
    return entity;
  }

  public async getStrategy() {
    const strategy = await this.strategyRepository.find({
      relations: ['steps'],
    });

    return strategy;
  }

  public async getStrategyById(id: number) {
    const strategy = await this.strategyRepository.findOne({
      where: { id },
      relations: ['steps'],
    });

    return strategy;
  }

  public async getStepById(id: number) {
    const step = await this.strategyStepRepository.findOne({
      where: { id },
    });

    return step;
  }

  public async getCurrentUserStrategies(userId: string) {
    const strategies = await this.strategyRepository.find({
      where: { userId },
      relations: ['steps'],
    });

    return strategies;
  }

  public async getAllSteps() {
    const steps = await this.strategyStepRepository.find({
      where: { isPublic: true },
    });

    return steps;
  }

  public async getPublicStrategies() {
    const steps = await this.strategyRepository.find({
      where: { isPublic: true },
      relations: ['steps'],
    });

    return steps;
  }
}
