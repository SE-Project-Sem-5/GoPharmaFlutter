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
// processing
// cancelled
// confirmed
// reserved
// collected
// transient
// transient-collected
// shipped
// delivered
