import 'package:flutter/material.dart';

@immutable
abstract class SignInEvent {}

class ErrorEvent extends SignInEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends SignInEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}
