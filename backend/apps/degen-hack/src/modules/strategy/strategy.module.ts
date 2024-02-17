import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { UserModule } from '../user';

import { StrategyService } from './application';
import { StrategyDomain } from './domain';
import {
  StrategyEntity,
  StrategyRepository,
  StrategyStepEntity,
  StrategyStepRepository,
} from './infrastructure';
import { StrategyController } from './presentation';

@Module({
  controllers: [StrategyController],
  exports: [],
  imports: [
    TypeOrmModule.forFeature([StrategyEntity, StrategyStepEntity]),
    UserModule,
  ],
  providers: [
    StrategyDomain,
    StrategyRepository,
    StrategyStepRepository,
    StrategyService,
  ],
})
export class StrategyModule {}
