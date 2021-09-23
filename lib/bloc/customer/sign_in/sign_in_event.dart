import 'package:flutter/material.dart';

@immutable
abstract class CustomerSignInEvent {}

class ErrorEvent extends CustomerSignInEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends CustomerSignInEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}

class SignInCustomer extends CustomerSignInEvent {
  SignInCustomer();
}
