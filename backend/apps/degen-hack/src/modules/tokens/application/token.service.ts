import { Injectable } from '@nestjs/common';
import { ethers } from 'ethers';

import { BlockchainEthDomain } from '../../blockchain-eth/domain';
import { UserDomain } from '../../user/domain';
import { TokenDomain } from '../domain/token.domain';

import {
  CreateCoordinateAroundShipParameters,
  GetTokensParameters,
} from './token.service-type';

@Injectable()
export class TokenService {
  constructor(
    private readonly tokenDomain: TokenDomain,
    private readonly blockchainEthDomain: BlockchainEthDomain,
    private readonly userDomain: UserDomain,
  ) {}

  public async getTokensInfo({ userId }: GetTokensParameters) {
    const user = await this.userDomain.getUserByUuid(userId);
    const tokensData = await this.tokenDomain.getTokens();
    const tokens = await this.blockchainEthDomain.getTokensInfo();
    const blockchainData = await this.blockchainEthDomain.getBlockchainData(
      user.walletAddress,
    );
    const data = tokensData.map((obj1) => ({
      ...obj1,
      avaliable:
        blockchainData.availableBorrowsBase /
        Number(
          ethers.utils.formatUnits(
            tokens.find((obj2) => obj2.symbol === obj1.name)
              ?.priceInMarketReferenceCurrency,
            8,
          ),
        ),
    }));

    return data;
  }
}
