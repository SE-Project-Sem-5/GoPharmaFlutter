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
  final int deliveryAgentHomeAddressID;

  CollectOrderEvent({
    this.deliveryAgentID,
    this.orderProductID,
    this.deliveryAgentHomeAddressID,
  });
}

class TransitionOrderEvent extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  final int deliveryAgentHomeAddressID;

  TransitionOrderEvent({
    this.deliveryAgentID,
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}

class TransitionCollectOrderEvent extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  final int deliveryAgentHomeAddressID;

  TransitionCollectOrderEvent({
    this.deliveryAgentID,
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}

class ShipOrderEvent extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  final int deliveryAgentHomeAddressID;

  ShipOrderEvent({
    this.deliveryAgentID,
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}

class DeliverCashOrder extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  final double amountPaid;
  final double checkoutDiscount;
  final String currency;
  final String customerEmail;
  final int customerID;

  DeliverCashOrder({
    @required this.deliveryAgentID,
    @required this.orderID,
    @required this.amountPaid,
    this.checkoutDiscount = 0.0,
    this.currency = "LKR",
    @required this.customerEmail,
    @required this.customerID,
  });
}

class DeliverOnlineOrder extends DeliveryListEvent {
  final int deliveryAgentID;
  final int orderID;
  final int deliveryAgentHomeAddressID;

  DeliverOnlineOrder({
    this.deliveryAgentID,
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}
