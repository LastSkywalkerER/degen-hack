import { Repository } from 'degen-hack/redis';

import { LoginMessageEntity } from '../entities';

export interface LoginMessageRepositoryInterface
  extends Repository<LoginMessageEntity> {}
