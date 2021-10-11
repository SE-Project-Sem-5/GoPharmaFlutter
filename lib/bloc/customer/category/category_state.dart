import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/category/category.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

@immutable
class CategoryState {
  final String error;
  final List<Category> categories;
  final bool isLoading;
  final Map<String, ProductList> categoryProduct;

  CategoryState({
    this.categories,
    this.error,
    this.isLoading,
    this.categoryProduct,
  });

  static CategoryState get initialState => CategoryState(
        error: '',
        categories: [],
        isLoading: false,
        categoryProduct: {},
      );

  CategoryState clone({
    String error = '',
    List<Category> categories,
    bool isLoading,
    Map<String, ProductList> categoryProduct,
  }) {
    return CategoryState(
      error: error,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      categoryProduct: categoryProduct ?? this.categoryProduct,
    );
  }
}
