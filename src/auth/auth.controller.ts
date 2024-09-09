import { Body, Controller, HttpCode, Post } from '@nestjs/common';
import { Credential } from './auth.dto';
import { AuthService } from './auth.service';

@Controller({
  version: '1',
  path: 'auth',
})
export class AuthController {
  constructor(private readonly authService: AuthService) {}
  @Post()
  @HttpCode(200)
  attempt(@Body() credential: Credential) {
    return this.authService.attempt(credential);
  }
}
