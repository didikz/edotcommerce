import { ConfigService } from '@nestjs/config';
import { config } from 'dotenv';

config();
const configService = new ConfigService();

export const JwtConstants = {
  secret: configService.get('JWT_SECRET'),
};
