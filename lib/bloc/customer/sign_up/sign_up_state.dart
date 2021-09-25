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

  CustomerSignUpState({
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
      );

  CustomerSignUpState clone({
    String error = '',
    bool isVisible = true,
    CustomerSignUpStep step,
    String twoFA,
  }) {
    return CustomerSignUpState(
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      step: step ?? this.step,
      twoFA: twoFA ?? this.twoFA,
    );
  }
}
