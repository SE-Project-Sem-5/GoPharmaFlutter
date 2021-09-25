import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_state.dart';

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

class NextStepEvent extends CustomerSignInEvent {
  final CustomerSignInStep currentStep;
  final BuildContext context;

  NextStepEvent({this.currentStep, this.context});
}

class PreviousStepEvent extends CustomerSignInEvent {
  final CustomerSignInStep currentStep;
  final BuildContext context;
  PreviousStepEvent({this.currentStep, this.context});
}

class UpdateTwoFA extends CustomerSignInEvent {
  final String twoFA;
  UpdateTwoFA({this.twoFA});
}
