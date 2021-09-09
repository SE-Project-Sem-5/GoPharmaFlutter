import 'package:flutter/material.dart';

@immutable
abstract class DeliveryAgentSignUpEvent {}

class ErrorEvent extends DeliveryAgentSignUpEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends DeliveryAgentSignUpEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}
