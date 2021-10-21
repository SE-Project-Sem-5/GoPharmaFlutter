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

class CustomerSignUpStep2 extends CustomerSignUpEvent {
  final String firstName;
  final String lastName;
  final String streetAddress;
  final String city;
  final String district;
  final String province;
  final String birthDate;
  final String gender;
  final String contactNumber;

  CustomerSignUpStep2({
    this.firstName,
    this.lastName,
    this.streetAddress,
    this.city,
    this.district,
    this.province,
    this.birthDate,
    this.gender,
    this.contactNumber,
  });
}
