import { CurrentUser } from '@degen-hack/auth';

declare global {
  namespace Express {
    interface Request {
      currentUser?: CurrentUser;
    }
  }
}
