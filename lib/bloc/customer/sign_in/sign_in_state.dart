import 'package:flutter/material.dart';

enum CustomerSignInStep {
  CUSTOMERSIGNINSTEP_START,
  CUSTOMERSIGNINSTEP_2FA,
}

@immutable
class CustomerSignInState {
  final String error;
  final bool isVisible;
  final CustomerSignInStep step;
  final String twoFA;

  CustomerSignInState({
    this.error,
    this.isVisible,
    this.step,
    this.twoFA,
  });

  static CustomerSignInState get initialState => CustomerSignInState(
        error: '',
        isVisible: true,
        step: CustomerSignInStep.CUSTOMERSIGNINSTEP_START,
        twoFA: '',
      );

  CustomerSignInState clone(
      {String error = '',
      bool isVisible = true,
      CustomerSignInStep step,
      String twoFA = ''}) {
    return CustomerSignInState(
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      step: step ?? this.step,
      twoFA: twoFA ?? this.twoFA,
    );
  }
}
