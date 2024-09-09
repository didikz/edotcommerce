import { MigrationInterface, QueryRunner, Table, TableIndex } from 'typeorm';

export class CreateProductWarehousePivot1725887251490
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'product_warehouse',
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
          },
          {
            name: 'warehouse_id',
            type: 'bigint',
          },
          {
            name: 'stock',
            type: 'int',
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
      'product_warehouse',
      new TableIndex({
        name: 'IDX_PRODUCT_ID_WAREHOUSE_ID',
        columnNames: ['product_id', 'warehouse_id'],
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('product_warehouse');
  }
}
