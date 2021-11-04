import 'package:flutter/material.dart';

@immutable
abstract class DeliveryListEvent {}

class ErrorEvent extends DeliveryListEvent {
  final String error;

  ErrorEvent(this.error);
}

class GetAllConfirmedOrders extends DeliveryListEvent {
  GetAllConfirmedOrders();
}

class GetAllReservedOrders extends DeliveryListEvent {
  GetAllReservedOrders();
}

class GetAllCollectedOrders extends DeliveryListEvent {
  GetAllCollectedOrders();
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
  final int orderProductID;
  ReserveOrderForDeliveryEvent({
    this.orderProductID,
  });
}

class CollectOrderEvent extends DeliveryListEvent {
  final int orderProductID;

  CollectOrderEvent({
    this.orderProductID,
  });
}

class TransitionOrderEvent extends DeliveryListEvent {
  final int orderID;

  TransitionOrderEvent({
    this.orderID,
  });
}

class TransitionCollectOrderEvent extends DeliveryListEvent {
  final int orderID;

  TransitionCollectOrderEvent({
    this.orderID,
  });
}

class ShipOrderEvent extends DeliveryListEvent {
  final int orderID;

  ShipOrderEvent({
    this.orderID,
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
