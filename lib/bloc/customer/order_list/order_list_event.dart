import 'package:flutter/material.dart';

@immutable
abstract class OrderListEvent {}

class ErrorEvent extends OrderListEvent {
  final String error;

  ErrorEvent(this.error);
}

class GetOrderListByStatus extends OrderListEvent {
  final String status;
  final int customerID;

  GetOrderListByStatus({this.customerID, this.status});
}

class GetAllOrders extends OrderListEvent {
  final int customerID;
  GetAllOrders({this.customerID});
}

class CancelOrder extends OrderListEvent {
  final int customerID;
  final int orderID;
  final BuildContext context;
  CancelOrder({this.customerID, this.orderID, this.context});
}

class CancelOrderProduct extends OrderListEvent {
  final int customerID;
  final int orderProductID;
  CancelOrderProduct({this.customerID, this.orderProductID});
}
