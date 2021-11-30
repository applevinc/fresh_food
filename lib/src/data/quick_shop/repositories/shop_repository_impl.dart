import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/data/quick_shop/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/domain/quick_shop/entities/shop_item_entity.dart';
import 'package:fresh_food_ui/src/domain/quick_shop/repository/shop_repository.dart';

class ShopRepositoryImpl implements IShopRepository {
  final IShopRemoteDataSource shopRemoteDataSource;

  ShopRepositoryImpl({@required this.shopRemoteDataSource});

  @override
  Future<List<ShopItemEntity>> fetchFruitItems() async {
    try {
      return await shopRemoteDataSource.fetchFruitItems();
    } catch (e) {
      rethrow;
    }
  }
}
