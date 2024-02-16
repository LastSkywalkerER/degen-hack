import { Injectable } from '@nestjs/common';
import { BadRequestException, ForbiddenException } from 'degen-hack/exceptions';
import { ContractInterface, ethers, utils } from 'ethers';

import { VerifyMessageParameters } from '../sdk-interfaces';

@Injectable()
export class BlockchainEthSdk {
  protected provider: ethers.providers.JsonRpcProvider;
  protected contract: ethers.Contract;
  protected contractAddress: string;
  protected abi: ContractInterface;
  protected interface: ethers.utils.Interface;

  constructor() {}

  public async verifyMessage({
    address,
    message,
    signature,
  }: VerifyMessageParameters) {
    try {
      const signerAddress = utils.verifyMessage(message, signature);
      if (signerAddress.toLowerCase() !== address.toLowerCase()) {
        throw new ForbiddenException('signature is invalid');
      }
    } catch (error) {
      throw new BadRequestException(error.message);
    }
  }
}
