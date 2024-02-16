import { Injectable } from '@nestjs/common';
import { NotFoundException } from 'degen-hack/exceptions';

import { BlockchainEthDomain } from '../../blockchain-eth/domain';
import { UserDomain } from '../domain';

@Injectable()
export class UserService {
  constructor(
    private readonly blockchainEthDomain: BlockchainEthDomain,
    private readonly userDomain: UserDomain,
  ) {}

  public async getCurrentUserData(userUuid: string) {
    const user = await this.userDomain.getUserByUuid(userUuid);

    if (!user) {
      throw new NotFoundException('user not found');
    }

    return user;
  }

  public async getUserByAdress(address: string) {
    return await this.userDomain.getUserByAdress({ address });
  }
}
