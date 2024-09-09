import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { ProductsModule } from './products/products.module';
import { CartsModule } from './carts/carts.module';
import { ConfigModule } from '@nestjs/config';
import { UserModule } from './user/user.module';
import { dataSourceOption } from './database/database.providers';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      useFactory: () => dataSourceOption,
    }),
    AuthModule,
    ProductsModule,
    CartsModule,
    UserModule,
  ],
})
export class AppModule {}
