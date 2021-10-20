import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';

@immutable
abstract class CustomerSignUpEvent {}

class ErrorEvent extends CustomerSignUpEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends CustomerSignUpEvent {
  ToggleVisibility();
}

class NextStepEvent extends CustomerSignUpEvent {
  final CustomerSignUpStep currentStep;
  final BuildContext context;

  NextStepEvent({this.currentStep, this.context});
}

class PreviousStepEvent extends CustomerSignUpEvent {
  final CustomerSignUpStep currentStep;
  final BuildContext context;
  PreviousStepEvent({this.currentStep, this.context});
}

class UpdateTwoFA extends CustomerSignUpEvent {
  final String twoFA;
  UpdateTwoFA({this.twoFA});
}

class SignUpStep1 extends CustomerSignUpEvent {
  final String email;
  final String password;
  final String role;
  SignUpStep1({
    this.email,
    this.password,
    this.role = "customer",
  });
}
