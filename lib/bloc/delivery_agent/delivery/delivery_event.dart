import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'delivery_state.dart';

@immutable
abstract class DeliveryEvent {}

class ErrorEvent extends DeliveryEvent {
  final String error;

  ErrorEvent(this.error);
}

class NextDeliveryStatusEvent extends DeliveryEvent {
  final DeliveryTransitionState currentState;
  final Delivery delivery;

  NextDeliveryStatusEvent(this.currentState, this.delivery);
}

class PreviousDeliveryStatusEvent extends DeliveryEvent {
  final DeliveryTransitionState currentState;
  final Delivery delivery;

  PreviousDeliveryStatusEvent(this.currentState, this.delivery);
}
