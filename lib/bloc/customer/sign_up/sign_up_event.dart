import 'package:flutter/material.dart';

@immutable
abstract class CustomerSignUpEvent {}

class ErrorEvent extends CustomerSignUpEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends CustomerSignUpEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}
