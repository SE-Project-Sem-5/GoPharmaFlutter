import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/category/category.dart';

@immutable
class CategoryState {
  final String error;
  final List<Category> categories;
  final bool isLoading;

  CategoryState({
    this.categories,
    this.error,
    this.isLoading,
  });

  static CategoryState get initialState => CategoryState(
        error: '',
        categories: [],
        isLoading: false,
      );

  CategoryState clone({
    String error = '',
    List<Category> categories,
    bool isLoading,
  }) {
    return CategoryState(
      error: error,
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
