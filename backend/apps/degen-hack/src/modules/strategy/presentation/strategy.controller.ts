import { apiConfig } from '@degen-hack/core';
import { Body, Controller, Get, Param, Post, UseGuards } from '@nestjs/common';
import { CurrentUser, JwtAuthGuard } from 'degen-hack/auth';
import { User } from 'degen-hack/auth/decorators/user.decorator';

import { StrategyService } from '../application/strategy.service';

import { AddPublicStrategyDto } from './input';

@Controller()
export class StrategyController {
  constructor(private readonly strategyService: StrategyService) {}

  @UseGuards(JwtAuthGuard)
  @Post(apiConfig.strategy.addPublicStrategy)
  async addPublicStrategy(@Body() strategy: AddPublicStrategyDto) {
    return await this.strategyService.addPublicStrategy(strategy);
  }

  @UseGuards(JwtAuthGuard)
  @Post(apiConfig.strategy.addUserStrategy)
  async addUserStrategy(
    @User() user: CurrentUser,
    @Body() strategy: AddPublicStrategyDto,
  ) {
    return await this.strategyService.addUserStrategy({
      ...strategy,
      userId: user.userUuid,
    });
  }

  @UseGuards(JwtAuthGuard)
  @Get(apiConfig.strategy.getAllSteps)
  async getAllSteps() {
    return await this.strategyService.getAllSteps();
  }

  @UseGuards(JwtAuthGuard)
  @Get(apiConfig.strategy.getCurrentUserStrategies)
  async getCurrentUserStrategies(@User() user: CurrentUser) {
    return await this.strategyService.getCurrentUserStrategies(user.userUuid);
  }

  @UseGuards(JwtAuthGuard)
  @Get(apiConfig.strategy.getPublicStrategies)
  async getPublicStrategies() {
    return await this.strategyService.getPublicStrategies();
  }

  @UseGuards(JwtAuthGuard)
  @Get(apiConfig.strategy.getStepById)
  async getStepById(@Param('id') id: number) {
    return await this.strategyService.getStepById(id);
  }

  @UseGuards(JwtAuthGuard)
  @Get(apiConfig.strategy.getStrategyById)
  async getStrategyById(@Param('id') id: number) {
    return await this.strategyService.getStrategyById(id);
  }
}
