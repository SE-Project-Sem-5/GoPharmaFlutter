import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/category/category.dart';

@immutable
class CategoryState {
  final String error;
  final List<Category> categories;

  CategoryState({
    this.categories,
    this.error,
  });

  static CategoryState get initialState => CategoryState(
        error: '',
        categories: [],
      );

  CategoryState clone({
    String error = '',
    List<Category> categories,
  }) {
    return CategoryState(
      error: error,
      categories: categories ?? this.categories,
    );
  }
}
