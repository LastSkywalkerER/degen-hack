import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, Repository } from 'typeorm';

import { StrategyStepEntity } from '../entities';

@Injectable()
export class StrategyStepRepository extends Repository<StrategyStepEntity> {
  constructor(
    @InjectRepository(StrategyStepEntity)
    private readonly strategyStepRepository: Repository<StrategyStepEntity>,
    private readonly dataSource: DataSource,
  ) {
    super(
      strategyStepRepository.target,
      strategyStepRepository.manager,
      strategyStepRepository.queryRunner,
    );
  }
}
