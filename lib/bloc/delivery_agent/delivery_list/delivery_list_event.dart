import 'package:flutter/material.dart';

@immutable
abstract class DeliveryListEvent {}

class ErrorEvent extends DeliveryListEvent {
  final String error;

  ErrorEvent(this.error);
}

class GetAllConfirmedOrders extends DeliveryListEvent {
  final int deliveryAgentID;
  final int deliveryAgentHomeAddressID;
  GetAllConfirmedOrders({
    this.deliveryAgentID,
    this.deliveryAgentHomeAddressID,
  });
}
