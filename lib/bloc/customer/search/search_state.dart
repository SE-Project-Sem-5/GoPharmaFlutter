import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

@immutable
class SearchState {
  final String error;
  final List<ProductList> searchResults;

  SearchState({
    this.searchResults,
    this.error,
  });

  static SearchState get initialState => SearchState(
        error: '',
        searchResults: [],
      );

  SearchState clone({
    String error = '',
    List<ProductList> searchResults,
  }) {
    return SearchState(
      error: error ?? this.error,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}
