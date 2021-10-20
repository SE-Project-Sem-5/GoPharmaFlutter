import 'package:flutter/material.dart';

enum CustomerSignUpStep {
  CUSTOMERSIGNUPSTEP_START,
  CUSTOMERSIGNUPSTEP_INFORMATION,
  CUSTOMERSIGNUPSTEP_2FA
}

@immutable
class CustomerSignUpState {
  final String error;
  final bool isVisible;
  final CustomerSignUpStep step;
  final String twoFA;
  final String email;
  final String password;
  final String role;

  CustomerSignUpState({
    this.email,
    this.password,
    this.role,
    this.error,
    this.isVisible,
    this.step,
    this.twoFA,
  });

  static CustomerSignUpState get initialState => CustomerSignUpState(
        error: '',
        isVisible: true,
        step: CustomerSignUpStep.CUSTOMERSIGNUPSTEP_START,
        twoFA: '',
        email: '',
        password: '',
        role: 'customer',
      );

  CustomerSignUpState clone({
    String error = '',
    bool isVisible = true,
    CustomerSignUpStep step,
    String twoFA,
    String email,
    String password,
  }) {
    return CustomerSignUpState(
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      email: email ?? this.email,
      password: password ?? this.password,
      step: step ?? this.step,
      twoFA: twoFA ?? this.twoFA,
    );
  }
}
