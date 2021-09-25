import 'package:flutter/material.dart';

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
  final DeliveryTransitionState orderTransitionState;
  final String state;

  DeliveryState({
    @required this.error,
    @required this.orderTransitionState,
    @required this.state,
  });

  static DeliveryState get initialState => DeliveryState(
        error: '',
        orderTransitionState: DeliveryTransitionState.CONFIRMED,
        state: 'confirmed',
      );

  DeliveryState clone({
    String error,
    DeliveryTransitionState orderTransitionState,
    String state,
  }) {
    return DeliveryState(
      error: error ?? this.error,
      orderTransitionState: orderTransitionState ?? this.orderTransitionState,
      state: state ?? this.state,
    );
  }
}
