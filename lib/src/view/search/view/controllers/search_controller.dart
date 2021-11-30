import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/global/product_entity.dart';
import 'package:fresh_food_ui/src/view/search/domain/usecases/fetch_product_usecase.dart';

enum SearchingStatus {
  initial,
  searching,
  results,
}

class SearchController extends ChangeNotifier {
  final FetchSearchResultUseCase? searchResultUseCase;
  SearchingStatus searchStatus = SearchingStatus.initial;

  SearchController(this.searchResultUseCase);

  List<ProductEntity> _results = [];
  List<ProductEntity> get results => _results;

  Future<List<ProductEntity>> getResults(String? query) async {
    searchStatus = SearchingStatus.searching;
    _results = await searchResultUseCase!.call(query);
    completed();
    notifyListeners();
    return _results;
  }

  void completed() {
    searchStatus = SearchingStatus.results;
    notifyListeners();
  }

  void reset() {
    searchStatus = SearchingStatus.initial;
    notifyListeners();
  }
}
