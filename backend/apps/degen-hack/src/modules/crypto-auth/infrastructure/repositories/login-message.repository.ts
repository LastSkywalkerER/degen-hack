import { Injectable } from '@nestjs/common';
import { InjectRedis, Redis } from '@nestjs-modules/ioredis';
import { Repository } from 'degen-hack/redis';
import { ImplementedClassValidator } from 'degen-hack/typings';

import { LoginMessageEntity } from '../entities';
import { LoginMessageRepositoryInterface } from '../repository-interfaces';

@Injectable()
export class LoginMessageRepository
  extends Repository<LoginMessageEntity>
  implements
    ImplementedClassValidator<
      LoginMessageRepository,
      LoginMessageRepositoryInterface
    >
{
  constructor(@InjectRedis() private readonly redis: Redis) {
    super(redis, {
      baseClass: LoginMessageEntity,
      storageKeyPrefix: LoginMessageRepository.name,
    });
  }
}
