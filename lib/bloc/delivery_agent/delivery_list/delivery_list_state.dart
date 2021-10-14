import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/deliveryListModel.dart';

@immutable
class DeliveryListState {
  final String error;
  final bool isLoading;
  final PendingDeliveryList confirmedOrders;

  DeliveryListState({
    this.confirmedOrders,
    this.error,
    this.isLoading,
  });

  static DeliveryListState get initialState => DeliveryListState(
        error: '',
        isLoading: false,
        confirmedOrders: new PendingDeliveryList(
          deliveries: [],
        ),
      );

  DeliveryListState clone({
    String error = '',
    // List<Category> categories,
    bool isLoading,
    PendingDeliveryList confirmedOrders,
  }) {
    return DeliveryListState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      confirmedOrders: confirmedOrders ?? this.confirmedOrders,
    );
  }
}
