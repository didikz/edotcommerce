import { MigrationInterface, QueryRunner, Table, TableIndex } from 'typeorm';

export class CreateProductReservationTable1725891035138
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'product_reservations',
        columns: [
          {
            name: 'id',
            type: 'bigint',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          {
            name: 'product_id',
            type: 'bigint',
            isNullable: true,
          },
          {
            name: 'warehouse_id',
            type: 'bigint',
            isNullable: true,
          },
          {
            name: 'cart_id',
            type: 'bigint',
            isUnique: true,
          },
          {
            name: 'reserved_qty',
            type: 'int',
            default: 0,
          },
          {
            name: 'expired_at',
            type: 'timestamp',
            isNullable: true,
          },
          {
            name: 'status',
            type: 'tinyint',
            default: 0,
          },
          {
            name: 'created_at',
            type: 'timestamp',
            default: 'CURRENT_TIMESTAMP',
            isNullable: true,
          },
          {
            name: 'updated_at',
            type: 'timestamp',
            default: 'CURRENT_TIMESTAMP',
            onUpdate: 'CURRENT_TIMESTAMP',
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
      'product_reservations',
      new TableIndex({
        name: 'IDX_PRODUCT_RESERVATION_PRODUCT_ID_WAREHOUSE_ID',
        columnNames: ['product_id', 'warehouse_id'],
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('product_reservations');
  }
}
