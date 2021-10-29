import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/normalOrderList.dart';

@immutable
class OrderListState {
  final String error;
  final Map<String, NormalOrderList> normalOrderList;
  final String status;
  final bool isLoading;

  OrderListState({
    this.error,
    this.status,
    this.normalOrderList,
    this.isLoading,
  });

  static OrderListState get initialState => OrderListState(
        error: '',
        status: '',
        normalOrderList: {},
        isLoading: false,
      );

  OrderListState clone({
    String error = '',
    Map<String, NormalOrderList> normalOrderList,
    String status,
    bool isLoading,
  }) {
    return OrderListState(
      error: error ?? this.error,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      normalOrderList: normalOrderList ?? this.normalOrderList,
    );
  }
}
