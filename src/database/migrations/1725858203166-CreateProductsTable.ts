import { MigrationInterface, QueryRunner, Table, TableIndex } from 'typeorm';

export class CreateProductsTable1725858203166 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.createTable(
      new Table({
        name: 'categories',
        columns: [
          {
            name: 'id',
            type: 'bigint',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          {
            name: 'name',
            type: 'varchar',
          },
          {
            name: 'slug',
            type: 'varchar',
            isUnique: true,
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
      'categories',
      new TableIndex({
        name: 'IDX_CATEGORIES_NAME',
        columnNames: ['name'],
      }),
    );
    await queryRunner.createTable(
      new Table({
        name: 'products',
        columns: [
          {
            name: 'id',
            type: 'bigint',
            isPrimary: true,
            isGenerated: true,
            generationStrategy: 'increment',
          },
          {
            name: 'name',
            type: 'varchar',
          },
          {
            name: 'sku',
            type: 'varchar',
          },
          {
            name: 'slug',
            type: 'varchar',
            isUnique: true,
          },
          {
            name: 'description',
            type: 'text',
          },
          {
            name: 'price',
            type: 'bigint',
            default: 0,
          },
          {
            name: 'stock',
            type: 'int',
            default: 0,
          },
          {
            name: 'qty_reserved',
            type: 'int',
            default: 0,
          },
          {
            name: 'main_image',
            type: 'varchar',
            isNullable: true,
          },
          {
            name: 'status',
            type: 'integer',
            default: 0,
          },
          {
            name: 'category_id',
            type: 'bigint',
            default: 0,
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
      'products',
      new TableIndex({
        name: 'IDX_PRODUCTS_NAME',
        columnNames: ['name'],
      }),
    );
    await queryRunner.createIndex(
      'products',
      new TableIndex({
        name: 'IDX_PRODUCTS_SLUG',
        columnNames: ['slug'],
      }),
    );
    await queryRunner.createIndex(
      'products',
      new TableIndex({
        name: 'IDX_CATEGORY_ID',
        columnNames: ['category_id'],
      }),
    );
    await queryRunner.createTable(
      new Table({
        name: 'product_images',
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
            name: 'url',
            type: 'varchar',
          },
          {
            name: 'caption',
            type: 'varchar',
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
      'product_images',
      new TableIndex({
        name: 'IDX_PRODUCT_IMAGES_PRODUCT_ID',
        columnNames: ['product_id'],
      }),
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.dropTable('product_images');
    await queryRunner.dropTable('products');
    await queryRunner.dropTable('categories');
  }
}
