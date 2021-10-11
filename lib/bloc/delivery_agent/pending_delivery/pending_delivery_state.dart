import 'package:flutter/material.dart';

@immutable
class PendingOrderState {
  final String error;
  // final List<Category> categories;
  final bool isLoading;

  PendingOrderState({
    // this.categories,
    this.error,
    this.isLoading,
  });

  static PendingOrderState get initialState => PendingOrderState(
        error: '',
        // categories: [],
        isLoading: false,
      );

  PendingOrderState clone({
    String error = '',
    // List<Category> categories,
    bool isLoading,
  }) {
    return PendingOrderState(
      error: error,
      // categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
