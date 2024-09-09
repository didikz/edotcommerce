import { Controller, Delete, Get, Put } from '@nestjs/common';
import { CartsService } from './carts.service';

@Controller({
  version: '1',
  path: 'carts',
})
export class CartsController {
  constructor(private readonly cartService: CartsService) {}
  @Get()
  mine() {
    return this.cartService.getMine();
  }

  @Put()
  addItemToCart() {
    return this.cartService.addItem('sku', 1);
  }

  @Delete()
  deleteItemFromCart() {
    return this.cartService.deleteItem('sku');
  }
}
