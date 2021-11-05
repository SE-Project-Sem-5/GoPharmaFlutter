import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

@immutable
class SearchState {
  final String error;
  final List<ProductList> searchResults;
  final String filter;
  SearchState({
    this.searchResults,
    this.filter,
    this.error,
  });

  static SearchState get initialState => SearchState(
        error: '',
        searchResults: [],
        filter: "productName",
      );

  SearchState clone({
    String error = '',
    List<ProductList> searchResults,
    String filter,
  }) {
    return SearchState(
      error: error ?? this.error,
      filter: filter ?? this.filter,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}
