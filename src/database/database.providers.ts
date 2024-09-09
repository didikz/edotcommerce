import { ConfigService } from '@nestjs/config';
import { DataSource, DataSourceOptions } from 'typeorm';
import { config } from 'dotenv';

config();
const configService = new ConfigService();

export const dataSourceOption: DataSourceOptions = {
  type: 'mysql',
  host: configService.get('DB_HOST'),
  port: configService.get('DB_PORT'),
  username: configService.get('DB_USERNAME'),
  password: configService.get('DB_PASSWORD'),
  database: configService.get('DB_NAME'),
  synchronize: configService.get('DB_SYNCHRONIZE'),
  migrationsTableName: 'migrations',
  migrations: [__dirname + '/migrations/**/*.ts'],
  entities: [__dirname + '/../**/*.entity{.ts,.js}'],
  migrationsRun: false,
  // logging: true,
};

const dataSource = new DataSource(dataSourceOption);
export default dataSource;
