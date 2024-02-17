import { Controller, Get, UseGuards } from '@nestjs/common';
import { apiConfig } from '@degen-hack/core';
import { CurrentUser, JwtAuthGuard } from 'degen-hack/auth';
import { User } from 'degen-hack/auth/decorators/user.decorator';

import { TokenService } from '../application/token.service';

@Controller()
export class TokenController {
  constructor(private readonly tokenService: TokenService) {}

  @UseGuards(JwtAuthGuard)
  @Get(apiConfig.token.getTokensInfo)
  async getTokensInfo(@User() user: CurrentUser) {
    return await this.tokenService.getTokensInfo({ userId: user.userUuid });
  }
}
