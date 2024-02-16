import { apiConfig } from '@degen-hack/core';
import { Controller, Post, Body, Res, Get, Req } from '@nestjs/common';
import { Response, Request } from 'express';

import { CryptoAuthService } from '../application';

import { LoginUserDto } from './dtos/login-user.dto';
import { VerifyMessageDto } from './dtos/verify-message.dto';

@Controller()
export class CryptoAuthController {
  constructor(private readonly cryptoAuthService: CryptoAuthService) {}

  @Post(apiConfig.cryptoAuth.authLogin)
  async authLogin(@Body() loginUserDTO: LoginUserDto): Promise<any> {
    try {
      return this.cryptoAuthService.challengeLoginMessage(loginUserDTO);
    } catch (error) {
      throw error;
    }
  }

  @Post(apiConfig.cryptoAuth.verifyMessage)
  async verifyMessage(
    @Body() verifyMessageDto: VerifyMessageDto,
    @Res() res: Response,
  ): Promise<any> {
    const tokens = await this.cryptoAuthService.verifyMessage(verifyMessageDto);

    res.json({
      success: true,
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    });
  }

  @Get(apiConfig.cryptoAuth.refreshToken)
  async refreshTokens(@Res() res: Response, @Req() req: Request): Promise<any> {
    const refreshToken = req.headers.authorization?.split(' ')[1];

    if (!refreshToken) {
      return res
        .status(401)
        .json({ success: false, message: 'Refresh token not provided' });
    }
    const tokens = await this.cryptoAuthService.refreshTokens(refreshToken);

    res.json({
      success: true,
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
    });
  }

  @Get(apiConfig.cryptoAuth.logout)
  async logout(@Req() req: Request, @Res() res: Response): Promise<any> {
    const accessToken = req.headers.authorization?.split(' ')[1];

    if (!accessToken) {
      return res
        .status(401)
        .json({ success: false, message: 'Access token not provided' });
    }

    await this.cryptoAuthService.deleteTokens(accessToken);

    res.json({
      success: true,
    });
  }
}
