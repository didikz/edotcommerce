import { Injectable } from '@nestjs/common';

@Injectable()
export class ProductsService {
  getAll() {
    const product = {
      id: 123,
      name: 'product A',
      sku: 'sku-a',
      description: 'lorem ipsum dolor sit amet',
      price: 25000,
      image_main: 'image link',
      slug: 'product-a',
      stock: 100,
      created_at: '2024-09-09 10:10:10',
      updated_at: '2024-09-09 10:10:10',
      images: ['image link', 'image link', 'image link'],
      category: {
        id: 1,
        name: 'category 1',
        slug: 'category-1',
      },
    };
    const products = [];
    for (let i = 0; i < 5; i++) {
      products.push(product);
    }
    return {
      data: products,
      pagination: {
        total_records: 5,
        current_page: 1,
        total_pages: 10,
        next_page: 2,
        prev_page: null,
      },
    };
  }

  getDetail(slug: string) {
    const product = {
      id: 123,
      name: 'product A',
      sku: 'sku-a',
      description: 'lorem ipsum dolor sit amet',
      price: 25000,
      image_main: 'image link',
      slug: slug,
      stock: 100,
      created_at: '2024-09-09 10:10:10',
      updated_at: '2024-09-09 10:10:10',
      images: ['image link', 'image link', 'image link'],
      category: {
        id: 1,
        name: 'category 1',
        slug: 'category-1',
      },
    };
    return product;
  }
}
