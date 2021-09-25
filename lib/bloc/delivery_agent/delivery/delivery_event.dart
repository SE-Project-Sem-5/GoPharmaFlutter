import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';

@immutable
abstract class DeliveryEvent {}

class ErrorEvent extends DeliveryEvent {
  final String error;

  ErrorEvent(this.error);
}

class NextDeliveryStatusEvent extends DeliveryEvent {
  final Delivery delivery;

  NextDeliveryStatusEvent(this.delivery);
}
