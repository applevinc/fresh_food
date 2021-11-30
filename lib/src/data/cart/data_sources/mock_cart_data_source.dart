
import 'package:fresh_food_ui/src/core/assets/product_images.dart';
import 'package:fresh_food_ui/src/data/cart/data_sources/cart_data_source.dart';
import 'package:fresh_food_ui/src/domain/cart/entities/cart_entity.dart';

class MockCartDataSourceImpl implements ICartDataSource {
  @override
  Future<List<CartEntity>> addItemsToCart() {
    return Future.value(_cart);
  }
}

var _cart = <CartEntity>[
  CartEntity(
    name: 'Broccoli',
    img: ProductImages.broccoli,
    price: 5,
    qty:  300,
  ),
  CartEntity(
    name: 'Kale',
    img: ProductImages.kale,
    price: 5,
    qty:  300,
  ),
  CartEntity(
    name: 'Red Pepper',
    img: ProductImages.red_pepper,
    price: 5,
    qty: 300,
  ),
  CartEntity(
    name: 'Strawberries',
    img: ProductImages.strawberry,
    price: 5,
    qty:  300,
  ),
];
