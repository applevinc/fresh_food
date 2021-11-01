import 'package:fresh_food_ui/src/cart/data/data_sources/cart_data_source.dart';
import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/core/assets/product_images.dart';

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
