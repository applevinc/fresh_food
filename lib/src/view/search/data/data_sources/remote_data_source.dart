import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/view/search/data/models/search_result_model.dart';

abstract class ISearchResultRemoteDataSource {
  Future<List<SearchResultModel>> fetchProduct(String query);
}

class SearchResultRemoteDataSourceImpl implements ISearchResultRemoteDataSource {
  final Dio dio;

  SearchResultRemoteDataSourceImpl({@required this.dio});

  @override
  Future<List<SearchResultModel>> fetchProduct(String query) {
    // implement fetchProduct : call to real remote database
    throw UnimplementedError();
  }
}
