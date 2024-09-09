import { MigrationInterface, QueryRunner, Table, TableIndex } from 'typeorm';

export class CreateOrdersTable1725892013908 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'orders',
        columns: [
          {
            name: 'id',
            type: 'bigint',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          {
            name: 'user_id',
            type: 'bigint',
          },
          {
            name: 'shipment_name',
            type: 'varchar',
          },
          {
            name: 'shipment_phone',
            type: 'varchar',
          },
          {
            name: 'shipment_address',
            type: 'varchar',
          },
          {
            name: 'shipment_province',
            type: 'varchar',
          },
          {
            name: 'shipment_city',
            type: 'varchar',
          },
          {
            name: 'shipment_postal_code',
            type: 'varchar',
            length: '10',
            isNullable: true,
          },
          {
            name: 'shipment_provider',
            type: 'varchar',
          },
          {
            name: 'shipment_tracking_number',
            type: 'varchar',
            isNullable: true,
          },
          {
            name: 'shipment_fee',
            type: 'bigint',
            default: 0,
          },
          {
            name: 'total_product_amount',
            type: 'bigint',
            default: 0,
          },
          {
            name: 'total_amount',
            type: 'bigint',
            default: 0,
          },
          {
            name: 'notes',
            type: 'text',
            isNullable: true,
          },
          {
            name: 'status',
            type: 'integer',
            default: 0,
          },
          {
            name: 'created_at',
            type: 'timestamp',
            default: 'CURRENT_TIMESTAMP',
            isNullable: true,
          },
          {
            name: 'paid_at',
            type: 'timestamp',
            isNullable: true,
          },
          {
            name: 'processed_at',
            type: 'timestamp',
            isNullable: true,
          },
          {
            name: 'shipped_at',
            type: 'timestamp',
            isNullable: true,
          },
          {
            name: 'received_at',
            type: 'timestamp',
            isNullable: true,
          },
          {
            name: 'completed_at',
            type: 'timestamp',
            isNullable: true,
          },
          {
            name: 'version',
            type: 'integer',
            default: 0,
            isNullable: true,
          },
        ],
      }),
    );
    await queryRunner.createIndex(
      'orders',
      new TableIndex({
        name: 'IDX_ORDERS_USER_ID',
        columnNames: ['user_id'],
      }),
    );
    await queryRunner.createIndex(
      'orders',
      new TableIndex({
        name: 'IDX_ORDERS_STATUS_CREATED_AT',
        columnNames: ['status', 'created_at'],
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('orders');
  }
}
