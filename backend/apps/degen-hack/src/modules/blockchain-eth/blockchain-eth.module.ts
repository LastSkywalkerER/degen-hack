import { Module, forwardRef } from '@nestjs/common';
import { CryptoModule } from 'degen-hack/crypto';

import { UserModule } from '../user';

import { BLOCKCHAIN_ETH_SDK_TOKEN } from './core';
import { BlockchainEthDomain } from './domain';
import { BlockchainEthSdk } from './infrastructure/sdk';

@Module({
  exports: [BlockchainEthDomain],
  imports: [forwardRef(() => UserModule), CryptoModule],
  providers: [
    { provide: BLOCKCHAIN_ETH_SDK_TOKEN, useClass: BlockchainEthSdk },
    BlockchainEthDomain,
  ],
})
export class BlockchainEthModule {}
