import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UnauthorizedException } from 'degen-hack/exceptions';

@Injectable()
export class JwtAuthGuard implements CanActivate {
  constructor(private jwtService: JwtService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const req = context.switchToHttp().getRequest();
    const authHeader = req.headers.authorization;

    try {
      if (!authHeader || !authHeader.startsWith('Bearer ')) {
        throw new UnauthorizedException({ message: 'user is not authorized' });
      }

      const token = authHeader.split(' ')[1];
      const user = this.jwtService.verify(token);
      req.user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
