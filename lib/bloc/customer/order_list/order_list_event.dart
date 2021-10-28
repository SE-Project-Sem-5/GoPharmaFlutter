import 'package:flutter/material.dart';

@immutable
abstract class OrderListEvent {}

class ErrorEvent extends OrderListEvent {
  final String error;

  ErrorEvent(this.error);
}

class GetOrderListByStatus extends OrderListEvent {
  final String status;

  GetOrderListByStatus({this.status});
}

class GetAllOrders extends OrderListEvent {
  GetAllOrders();
}

class CancelOrder extends OrderListEvent {
  final int orderID;
  final BuildContext context;
  CancelOrder({this.orderID, this.context});
}

class CancelOrderProduct extends OrderListEvent {
  final BuildContext context;
  final int orderProductID;
  CancelOrderProduct({this.orderProductID, this.context});
}
