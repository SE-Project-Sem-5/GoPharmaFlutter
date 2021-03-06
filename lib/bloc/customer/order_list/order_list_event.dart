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

class GetAllNormalOrders extends OrderListEvent {
  GetAllNormalOrders();
}

class GetAllPrescriptionOrders extends OrderListEvent {
  GetAllPrescriptionOrders();
}

class CancelOrder extends OrderListEvent {
  final int orderID;
  CancelOrder({this.orderID});
}

class CancelOrderProduct extends OrderListEvent {
  final BuildContext context;
  final int orderProductID;
  CancelOrderProduct({this.orderProductID, this.context});
}
