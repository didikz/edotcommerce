import { Controller, Get, HttpCode, Param } from '@nestjs/common';
import { ProductsService } from './products.service';

@Controller({
  version: '1',
  path: 'products',
})
export class ProductsController {
  constructor(private readonly productService: ProductsService) {}

  @Get()
  getAll() {
    return this.productService.getAll();
  }

  @Get(':slug')
  getDetail(@Param('slug') slug: string) {
    return this.productService.getDetail(slug);
  }
}
