import { MigrationInterface, QueryRunner, Table, TableIndex } from 'typeorm';

export class CreateCartTable1725888318745 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'carts',
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
            isNullable: true,
          },
          {
            name: 'unique_identifier',
            type: 'varchar',
            isUnique: true,
          },
          {
            name: 'status',
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
      'carts',
      new TableIndex({
        name: 'IDX_CARTS_USER_ID_STATUS',
        columnNames: ['user_id', 'status'],
      }),
    );
    await queryRunner.createTable(
      new Table({
        name: 'cart_items',
        columns: [
          {
            name: 'id',
            type: 'bigint',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          {
            name: 'cart_id',
            type: 'bigint',
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
            name: 'qty',
            type: 'int',
            default: 1,
          },
          {
            name: 'price',
            type: 'bigint',
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
      'cart_items',
      new TableIndex({
        name: 'IDX_CARTS_ITEMS_CART_ID',
        columnNames: ['cart_id'],
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('cart_items');
    await queryRunner.dropTable('carts');
  }
}
