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

  CustomerSignUpState({
    this.error,
    this.isVisible,
    this.step,
  });

  static CustomerSignUpState get initialState => CustomerSignUpState(
        error: '',
        isVisible: true,
        step: CustomerSignUpStep.CUSTOMERSIGNUPSTEP_START,
      );

  CustomerSignUpState clone({
    String error = '',
    bool isVisible = true,
    CustomerSignUpStep step,
  }) {
    return CustomerSignUpState(
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      step: step ?? this.step,
    );
  }
}
