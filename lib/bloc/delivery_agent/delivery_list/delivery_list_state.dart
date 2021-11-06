import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/collectedDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/pendingDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnCollectedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnReservedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/shippedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientCollectedList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientDelivery.dart';

@immutable
class DeliveryListState {
  final String error;
  final bool isLoading;
  final PendingDeliveryList confirmedOrders;
  final ReservedDeliveryList reservedOrders;
  final CollectedDeliveryList collectedOrders;
  final TransientDeliveryList transientOrders;
  final TransientCollectedList transientCollectedOrders;
  final ShippedOrderList shippedOrders;
  final ReturnToBeReservedOrderList returnToBeReservedOrders;
  final ReturnCollectedOrderList returnReservedOrders;
  final ReturnCollectedOrderList returnCollectedOrders;

  DeliveryListState({
    this.confirmedOrders,
    this.reservedOrders,
    this.collectedOrders,
    this.transientOrders,
    this.transientCollectedOrders,
    this.shippedOrders,
    this.error,
    this.isLoading,
    this.returnToBeReservedOrders,
    this.returnReservedOrders,
    this.returnCollectedOrders,
  });

  static DeliveryListState get initialState => DeliveryListState(
        error: '',
        isLoading: false,
        confirmedOrders: new PendingDeliveryList(
          deliveries: [],
        ),
        reservedOrders: new ReservedDeliveryList(
          deliveries: [],
        ),
        collectedOrders: new CollectedDeliveryList(
          deliveries: [],
        ),
        transientOrders: new TransientDeliveryList(
          deliveries: [],
        ),
        transientCollectedOrders: new TransientCollectedList(
          deliveries: [],
        ),
        shippedOrders: new ShippedOrderList(
          deliveries: [],
        ),
        returnToBeReservedOrders: new ReturnToBeReservedOrderList(
          deliveries: [],
        ),
        returnReservedOrders: new ReturnCollectedOrderList(
          deliveries: [],
        ),
        returnCollectedOrders: new ReturnCollectedOrderList(
          deliveries: [],
        ),
      );

  DeliveryListState clone({
    String error = '',
    bool isLoading,
    PendingDeliveryList confirmedOrders,
    ReservedDeliveryList reservedOrders,
    CollectedDeliveryList collectedOrders,
    TransientDeliveryList transientOrders,
    TransientCollectedList transientCollectedOrders,
    ShippedOrderList shippedOrders,
    ReturnToBeReservedOrderList returnToBeReservedOrders,
    ReturnCollectedOrderList returnReservedOrders,
    ReturnCollectedOrderList returnCollectedOrders,
  }) {
    return DeliveryListState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      confirmedOrders: confirmedOrders ?? this.confirmedOrders,
      reservedOrders: reservedOrders ?? this.reservedOrders,
      collectedOrders: collectedOrders ?? this.collectedOrders,
      transientOrders: transientOrders ?? this.transientOrders,
      transientCollectedOrders:
          transientCollectedOrders ?? this.transientCollectedOrders,
      shippedOrders: shippedOrders ?? this.shippedOrders,
      returnToBeReservedOrders:
          returnToBeReservedOrders ?? this.returnToBeReservedOrders,
      returnReservedOrders: returnReservedOrders ?? this.returnReservedOrders,
      returnCollectedOrders:
          returnCollectedOrders ?? this.returnCollectedOrders,
    );
  }
}
