import 'package:flutter/material.dart';

@immutable
abstract class DeliveryListEvent {}

class ErrorEvent extends DeliveryListEvent {
  final String error;

  ErrorEvent(this.error);
}

class GetAllConfirmedOrders extends DeliveryListEvent {
  final int deliveryAgentHomeAddressID;
  GetAllConfirmedOrders({
    this.deliveryAgentHomeAddressID,
  });
}

class GetAllReservedOrders extends DeliveryListEvent {
  final int deliveryAgentHomeAddressID;
  GetAllReservedOrders({
    this.deliveryAgentHomeAddressID,
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
  GetAllTransientCollectedOrders();
}

class GetAllShippedOrders extends DeliveryListEvent {
  GetAllShippedOrders();
}

class ReserveOrderForDeliveryEvent extends DeliveryListEvent {
  final int deliveryAgentHomeAddressID;
  final int orderProductID;
  ReserveOrderForDeliveryEvent({
    this.orderProductID,
    this.deliveryAgentHomeAddressID,
  });
}

class CollectOrderEvent extends DeliveryListEvent {
  final int orderProductID;
  final int deliveryAgentHomeAddressID;

  CollectOrderEvent({
    this.orderProductID,
    this.deliveryAgentHomeAddressID,
  });
}

class TransitionOrderEvent extends DeliveryListEvent {
  final int orderID;
  final int deliveryAgentHomeAddressID;

  TransitionOrderEvent({
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}

class TransitionCollectOrderEvent extends DeliveryListEvent {
  final int orderID;
  final int deliveryAgentHomeAddressID;

  TransitionCollectOrderEvent({
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}

class ShipOrderEvent extends DeliveryListEvent {
  final int orderID;
  final int deliveryAgentHomeAddressID;

  ShipOrderEvent({
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}

class DeliverCashOrder extends DeliveryListEvent {
  final int orderID;
  final double amountPaid;
  final double checkoutDiscount;
  final String currency;
  final String customerEmail;
  final int customerID;

  DeliverCashOrder({
    @required this.orderID,
    @required this.amountPaid,
    this.checkoutDiscount = 0.0,
    this.currency = "LKR",
    @required this.customerEmail,
    @required this.customerID,
  });
}

class DeliverOnlineOrder extends DeliveryListEvent {
  final int orderID;
  final int deliveryAgentHomeAddressID;

  DeliverOnlineOrder({
    this.orderID,
    this.deliveryAgentHomeAddressID,
  });
}
