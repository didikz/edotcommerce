import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  CreateDateColumn,
  UpdateDateColumn,
  VersionColumn,
  ManyToOne,
} from 'typeorm';
import { Product } from './products.entity';

@Entity({ synchronize: false, name: 'product_images' })
export class ProductImage {
  @PrimaryGeneratedColumn({ type: 'bigint' })
  id: number;

  @Column({ type: 'bigint' })
  product_id: number;

  @Column({ type: 'varchar' })
  url: string;

  @Column({ type: 'varchar', nullable: true })
  caption: string;

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @VersionColumn()
  version: number;

  @ManyToOne(() => Product, (product) => product.images)
  product: Product;
}
