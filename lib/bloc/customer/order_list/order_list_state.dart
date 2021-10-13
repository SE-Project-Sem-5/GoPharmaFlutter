import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';

@immutable
class OrderListState {
  final String error;
  final Map<String, OrderList> orderList;

  OrderListState({
    this.error,
    this.orderList,
  });

  static OrderListState get initialState => OrderListState(
        error: '',
        orderList: {},
      );

  OrderListState clone({
    String error = '',
    Map<String, OrderList> orderList,
  }) {
    return OrderListState(
      error: error ?? this.error,
      orderList: orderList ?? this.orderList,
    );
  }
}
