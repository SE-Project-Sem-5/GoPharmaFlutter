import 'package:flutter/material.dart';

enum DeliveryTransitionState {
  SCHEDULED,
  IN_TRANSIT,
  DELIVERED,
  PAID,
}

@immutable
class DeliveryState {
  final String error;
  final DeliveryTransitionState orderTransitionState;

  DeliveryState({
    required this.error,
    required this.orderTransitionState,
  });

  static DeliveryState get initialState => DeliveryState(
        error: '',
        orderTransitionState: DeliveryTransitionState.SCHEDULED,
      );

  DeliveryState clone({
    String error = '',
    DeliveryTransitionState orderTransitionState =
        DeliveryTransitionState.SCHEDULED,
  }) {
    return DeliveryState(
      error: error,
      orderTransitionState: orderTransitionState,
    );
  }
}
