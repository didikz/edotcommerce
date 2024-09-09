import { MigrationInterface, QueryRunner, Table, TableIndex } from 'typeorm';

export class CreateOrderItemsTable1725892762719 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'order_items',
        columns: [
          {
            name: 'id',
            type: 'bigint',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          {
            name: 'order_id',
            type: 'bigint',
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
            name: 'qty',
            type: 'int',
            default: 1,
          },
          {
            name: 'price',
            type: 'bigint',
            default: 0,
          },
          {
            name: 'total_price',
            type: 'bigint',
            default: 0,
          },
          {
            name: 'product_snapshot',
            type: 'text',
            isNullable: true,
          },
          {
            name: 'created_at',
            type: 'timestamp',
            default: 'CURRENT_TIMESTAMP',
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
      'order_items',
      new TableIndex({
        name: 'IDX_ORDER_ITEMS_ORDER_ID',
        columnNames: ['order_id'],
      }),
    );
    await queryRunner.createIndex(
      'order_items',
      new TableIndex({
        name: 'IDX_ORDER_ITEMS_PRODUCT_ID',
        columnNames: ['product_id'],
      }),
    );
    await queryRunner.createIndex(
      'order_items',
      new TableIndex({
        name: 'IDX_ORDER_ITEMS_WAREHOUSE_ID',
        columnNames: ['warehouse_id'],
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('order_items');
  }
}
