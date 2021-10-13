import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';

@immutable
class OrderListState {
  final String error;
  final Map<String, OrderList> orderList;
  final String status;
  final bool isLoading;

  OrderListState({
    this.error,
    this.status,
    this.orderList,
    this.isLoading,
  });

  static OrderListState get initialState => OrderListState(
        error: '',
        status: '',
        orderList: {},
        isLoading: false,
      );

  OrderListState clone({
    String error = '',
    Map<String, OrderList> orderList,
    String status,
    bool isLoading,
  }) {
    return OrderListState(
      error: error ?? this.error,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      orderList: orderList ?? this.orderList,
    );
  }
}
