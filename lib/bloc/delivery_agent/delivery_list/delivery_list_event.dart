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

class GetAllReservedOrders extends DeliveryListEvent {
  final int deliveryAgentID;
  GetAllReservedOrders({
    this.deliveryAgentID,
  });
}

class GetAllCollectedOrders extends DeliveryListEvent {
  final int deliveryAgentHomeAddressID;
  GetAllCollectedOrders({
    this.deliveryAgentHomeAddressID,
  });
}

class GetAllTransientOrders extends DeliveryListEvent {
  GetAllTransientOrders();
}

class GetAllTransientCollectedOrders extends DeliveryListEvent {
  final int deliveryAgentHomeAddressID;
  GetAllTransientCollectedOrders({
    this.deliveryAgentHomeAddressID,
  });
}
