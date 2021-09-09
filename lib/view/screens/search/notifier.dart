import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fresh_food_ui/view/images.dart';

enum SearchStatus {
  initial,
  searching,
  results,
}

class Product extends Equatable {
  final String name;
  final String img;

  Product({this.name, this.img});

  @override
  List<Object> get props => [name, img];
}

class SearchNotifier extends ChangeNotifier {
  SearchStatus searchStatus = SearchStatus.initial;

  List<Product> _results = [
    Product(name: "Brocolli", img: ProductImages.broccoli),
    Product(name: "Strawberries", img: ProductImages.strawberry),
  ];
  List<Product> get results => _results;

  void getResults(String query) {
    searchStatus = SearchStatus.searching;
    notifyListeners();
    // take query to database to get a list of products
    // _results = list of products from database
  }

  void completed() {
    searchStatus = SearchStatus.results;
    notifyListeners();
  }

  void reset() {
    searchStatus = SearchStatus.initial;
    notifyListeners();
  }
}
