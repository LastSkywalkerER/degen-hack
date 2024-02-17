import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, Repository } from 'typeorm';

import { StrategyEntity } from '../entities';

@Injectable()
export class StrategyRepository extends Repository<StrategyEntity> {
  constructor(
    @InjectRepository(StrategyEntity)
    private readonly strategyRepository: Repository<StrategyEntity>,
    private readonly dataSource: DataSource,
  ) {
    super(
      strategyRepository.target,
      strategyRepository.manager,
      strategyRepository.queryRunner,
    );
  }
}
