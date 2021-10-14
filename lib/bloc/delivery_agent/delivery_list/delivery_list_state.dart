import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/deliveryListModel.dart';

@immutable
class DeliveryListState {
  final String error;
  final bool isLoading;
  final DeliveryList confirmedOrders;

  DeliveryListState({
    this.confirmedOrders,
    this.error,
    this.isLoading,
  });

  static DeliveryListState get initialState => DeliveryListState(
        error: '',
        isLoading: false,
        confirmedOrders: new DeliveryList(
          deliveries: [],
        ),
      );

  DeliveryListState clone({
    String error = '',
    // List<Category> categories,
    bool isLoading,
    DeliveryList confirmedOrders,
  }) {
    return DeliveryListState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      confirmedOrders: confirmedOrders ?? this.confirmedOrders,
    );
  }
}
