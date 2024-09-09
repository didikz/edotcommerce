import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Credential } from './auth.dto';
import { User } from 'src/user/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
    private jwtService: JwtService,
  ) {}
  async attempt(credential: Credential) {
    const user = await this.userRepository.findOne({
      select: ['id', 'email', 'password', 'name', 'status'],
      where: [
        { email: credential.mail_phone, status: '1' },
        { phone: credential.mail_phone, status: '1' },
      ],
    });
    if (!user) {
      throw new UnauthorizedException();
    }

    const isPasswordValid = await bcrypt.compare(
      credential.password,
      user.password,
    );

    if (!isPasswordValid) {
      throw new UnauthorizedException();
    }

    const jwtPayload = { sub: user.id, username: user.email };

    return { token: await this.jwtService.signAsync(jwtPayload) };
  }
}
