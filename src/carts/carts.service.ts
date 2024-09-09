import { Injectable } from '@nestjs/common';

@Injectable()
export class CartsService {
  getMine() {
    return {
      error: 'cart is empty',
    };
  }

  addItem(sku: string, quantity: number) {
    console.log(sku + ' ' + quantity);
    return {
      message: 'item added successfully',
    };
  }

  deleteItem(sku: string) {
    return {
      message: 'item' + sku + ' deleted successfully',
    };
  }

  createOrder() {
    return {
      message: 'order created successfully',
    };
  }
}
