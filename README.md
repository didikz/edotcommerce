# EDOTCOMMERCE API

An API for EDOTCOMMERCE platform. Consists of

+ [x] Authentication API: POST `/v1/auth`
+ [ ] Get Products API: GET `/v1/products`
+ [ ] Get Product detail API: GET `/v1/products/{slug}`
+ [ ] Get Carts API: GET `/v1/carts`
+ [ ] Put Item to Cart: PUT `/v1/carts`
+ [ ] Delete Item from Cart: DELETE `/v1/carts`
+ [ ] Checkout Order: POST `/v1/carts/checkout`

## Entity Relationship Diagram

![ERD Diagram](./edotcommerce.png)

## Setup & Installations

+ Clone repository
+ Install dependencies `npm install`
+ Run mysql server and create database named `edotcommerce`
+ adjust database configuration by copying env file `cp .env.example .env`
+ Run migration using `npm run migration:run` or import sql file `edotcommerce.sql` to created database
+ Run API with `npm run start:dev`
