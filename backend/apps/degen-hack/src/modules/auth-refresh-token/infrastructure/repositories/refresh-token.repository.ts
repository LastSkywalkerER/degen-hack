import { Injectable } from '@nestjs/common';
import { InjectRedis, Redis } from '@nestjs-modules/ioredis';
import { Repository } from 'degen-hack/redis';
import { ImplementedClassValidator } from 'degen-hack/typings';

import { RefreshTokenEntity } from '../entities';
import { RefreshTokenRepositoryInterface } from '../repository-interfaces';

@Injectable()
export class RefreshTokenRepository
  extends Repository<RefreshTokenEntity>
  implements
    ImplementedClassValidator<
      RefreshTokenRepository,
      RefreshTokenRepositoryInterface
    >
{
  constructor(@InjectRedis() private readonly redis: Redis) {
    super(redis, {
      baseClass: RefreshTokenEntity,
      storageKeyPrefix: RefreshTokenRepository.name,
    });
  }
}
