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
// processing
// cancelled
// confirmed
// reserved
// collected
// transient
// transient-collected
// shipped
// delivered
