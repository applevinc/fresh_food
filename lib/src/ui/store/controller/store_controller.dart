import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/services/store/store_service.dart';
import 'package:fresh_food_ui/src/ui/store/models/store_item.dart';

class StoreController extends ChangeNotifier {
  late final StoreService _storeService;

  StoreController({required StoreService storeService}) : _storeService = storeService;

  List<StoreItem> _foods = [];
  List<StoreItem> get foods => _foods;
  StoreItem? _featuredFood;
  StoreItem? get featuredFood => _featuredFood;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getFeatureFood() async {
    try {
      _setIsLoading(true);
      final food = await _storeService.getFeaturedFood();
      _featuredFood = StoreItem(
        backgroundColor: _generateBackgroundColor(),
        name: food.name,
        imgUrl: food.imgUrl,
        description: food.description,
        storage: food.storage,
        origin: food.origin,
        usage: food.usage,
        type: food.type,
        nutrients: food.nutrients,
      );
      _setIsLoading(false);
    } on Failure {
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<void> getStore() async {
    try {
      _setIsLoading(true);
      final store = await _storeService.fetchStore();
      _foods = store
          .map((element) => StoreItem(
                backgroundColor: _generateBackgroundColor(),
                name: element.name,
                imgUrl: element.imgUrl,
                description: element.description,
                storage: element.storage,
                origin: element.origin,
                usage: element.usage,
                type: element.type,
                nutrients: element.nutrients,
              ))
          .toList();
      _setIsLoading(false);
    } on Failure {
      _setIsLoading(false);
      rethrow;
    }
  }

  Color _generateBackgroundColor() {
    final colors = [
      Colors.red,
      Colors.yellow,
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];

    final randIndex = Random().nextInt(colors.length - 1);
    return colors[randIndex].withOpacity(.2);
  }
}
