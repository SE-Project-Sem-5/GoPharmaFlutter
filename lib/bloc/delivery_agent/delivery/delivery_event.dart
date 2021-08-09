import 'package:flutter/material.dart';
import 'delivery_state.dart';

@immutable
abstract class DeliveryEvent {}

class ErrorEvent extends DeliveryEvent {
  final String error;

  ErrorEvent(this.error);
}

class NextDeliveryStatusEvent extends DeliveryEvent {
  final DeliveryTransitionState currentState;

  NextDeliveryStatusEvent(this.currentState);
}

class PreviousDeliveryStatusEvent extends DeliveryEvent {
  final DeliveryTransitionState currentState;

  PreviousDeliveryStatusEvent(this.currentState);
}
