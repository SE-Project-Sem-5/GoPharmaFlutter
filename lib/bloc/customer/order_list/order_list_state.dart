import 'package:flutter/material.dart';

@immutable
class OrderListState {
  final String error;

  OrderListState({
    this.error,
  });

  static OrderListState get initialState => OrderListState(
        error: '',
      );

  OrderListState clone({
    String error = '',
  }) {
    return OrderListState(
      error: error,
    );
  }
}
