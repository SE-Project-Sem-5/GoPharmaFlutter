import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';

@immutable
class OrderListState {
  final String error;
  final Map<String, OrderList> orderList;
  final String status;

  OrderListState({
    this.error,
    this.status,
    this.orderList,
  });

  static OrderListState get initialState => OrderListState(
        error: '',
        status: '',
        orderList: {},
      );

  OrderListState clone({
    String error = '',
    Map<String, OrderList> orderList,
    String status,
  }) {
    return OrderListState(
      error: error ?? this.error,
      status: status ?? this.status,
      orderList: orderList ?? this.orderList,
    );
  }
}
