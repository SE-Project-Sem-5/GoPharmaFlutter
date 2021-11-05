import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

@immutable
class SearchState {
  final String error;
  final Map<String, ProductList> searchResults;
  final String filter;
  final bool isLoading;
  SearchState({
    this.searchResults,
    this.isLoading,
    this.filter,
    this.error,
  });

  static SearchState get initialState => SearchState(
        error: '',
        searchResults: {
          "productBrand": new ProductList(
            products: [],
          ),
          "productSupplier": new ProductList(
            products: [],
          ),
          "productName": new ProductList(
            products: [],
          ),
        },
        filter: "productName",
        isLoading: false,
      );

  SearchState clone({
    String error = '',
    Map<String, ProductList> searchResults,
    String filter,
    bool isLoading,
  }) {
    return SearchState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      filter: filter ?? this.filter,
      searchResults: searchResults ?? this.searchResults,
    );
  }
}
