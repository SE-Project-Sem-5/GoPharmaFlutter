import 'package:flutter/material.dart';

@immutable
abstract class DeliveryAgentSignInEvent {}

class ErrorEvent extends DeliveryAgentSignInEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends DeliveryAgentSignInEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}
