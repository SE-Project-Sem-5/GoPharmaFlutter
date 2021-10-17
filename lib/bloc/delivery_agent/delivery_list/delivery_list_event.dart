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
  final int deliveryAgentID;
  GetAllTransientCollectedOrders({
    this.deliveryAgentID,
  });
}

class GetAllShippedOrders extends DeliveryListEvent {
  GetAllShippedOrders();
}

class ReserveOrderForDeliveryEvent extends DeliveryListEvent {
  final int deliveryAgentHomeAddressID;
  final int deliveryAgentID;
  final int orderProductID;
  ReserveOrderForDeliveryEvent({
    this.deliveryAgentID,
    this.orderProductID,
    this.deliveryAgentHomeAddressID,
  });
}

class CollectOrderEvent extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderProductID;
  CollectOrderEvent({this.deliveryAgentID, this.orderProductID});
}

class TransitionOrderEvent extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  TransitionOrderEvent({this.deliveryAgentID, this.orderID});
}

class TransitionCollectOrderEvent extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  TransitionCollectOrderEvent({this.deliveryAgentID, this.orderID});
}

class ShipOrderEvent extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  ShipOrderEvent({this.deliveryAgentID, this.orderID});
}
