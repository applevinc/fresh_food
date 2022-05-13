import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/ui/store/models/store_item.dart';

class StoreController extends ChangeNotifier {
  List<StoreItem> _foods = [];
  List<StoreItem> get foods => _foods;
  late StoreItem _featuredFood;
  StoreItem get featuredFood => _featuredFood;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
