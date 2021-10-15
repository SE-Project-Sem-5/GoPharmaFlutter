import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/collectedDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/pendingDelivery.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';

@immutable
class DeliveryListState {
  final String error;
  final bool isLoading;
  final PendingDeliveryList confirmedOrders;
  final ReservedDeliveryList reservedOrders;
  final CollectedDeliveryList collectedOrders;

  DeliveryListState({
    this.confirmedOrders,
    this.reservedOrders,
    this.collectedOrders,
    this.error,
    this.isLoading,
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
      );

  DeliveryListState clone({
    String error = '',
    // List<Category> categories,
    bool isLoading,
    PendingDeliveryList confirmedOrders,
    ReservedDeliveryList reservedOrders,
    CollectedDeliveryList collectedOrders,
  }) {
    return DeliveryListState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      confirmedOrders: confirmedOrders ?? this.confirmedOrders,
      reservedOrders: reservedOrders ?? this.reservedOrders,
      collectedOrders: collectedOrders ?? this.collectedOrders,
    );
  }
}
