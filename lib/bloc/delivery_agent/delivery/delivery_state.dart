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
  final String state;

  DeliveryState({
    @required this.error,
    @required this.orderTransitionState,
    @required this.state,
  });

  static DeliveryState get initialState => DeliveryState(
        error: '',
        orderTransitionState: DeliveryTransitionState.SCHEDULED,
        state: 'Scheduled',
      );

  DeliveryState clone({
    String error = '',
    DeliveryTransitionState orderTransitionState =
        DeliveryTransitionState.SCHEDULED,
    String state = '',
  }) {
    return DeliveryState(
      error: error,
      orderTransitionState: orderTransitionState,
      state: state,
    );
  }
}
