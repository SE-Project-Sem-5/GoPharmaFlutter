import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';

enum DeliveryTransitionState {
  CONFIRMED,
  COLLECTED,
  TRANSIENT,
  SHIPPED,
  DELIVERED,
}

@immutable
class DeliveryState {
  final String error;
  final Delivery delivery;

  DeliveryState({
    @required this.error,
    @required this.delivery,
  });

  static DeliveryState get initialState => DeliveryState(
        error: '',
        delivery: Delivery(),
      );

  DeliveryState clone({
    String error,
    Delivery delivery,
  }) {
    return DeliveryState(
      error: error ?? this.error,
      delivery: delivery ?? this.delivery,
    );
  }
}
