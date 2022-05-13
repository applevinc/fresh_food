import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/models/food.dart';

enum SearchingStatus {
  initial,
  searching,
  results,
}

class SearchController extends ChangeNotifier {
  SearchingStatus searchStatus = SearchingStatus.initial;

  List<Food> _searchResults = [];
  List<Food> get searchResults => _searchResults;

  Future<void> getResults(String query) async {}

  void completed() {
    searchStatus = SearchingStatus.results;
    notifyListeners();
  }

  void reset() {
    searchStatus = SearchingStatus.initial;
    notifyListeners();
  }
}
