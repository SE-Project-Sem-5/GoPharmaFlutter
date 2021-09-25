import 'package:flutter/material.dart';

enum DeliveryAgentSignUpStep {
  DELIVERYAGENTSIGNUPSTEP_START,
  DELIVERYAGENTSIGNUPSTEP_INFORMATION,
  DELIVERYAGENTSIGNUPSTEP_2FA
}

@immutable
class DeliveryAgentSignUpState {
  final String error;
  final bool isVisible;
  final DeliveryAgentSignUpStep step;
  final String twoFA;

  DeliveryAgentSignUpState({
    this.error,
    this.isVisible,
    this.step,
    this.twoFA,
  });

  static DeliveryAgentSignUpState get initialState => DeliveryAgentSignUpState(
        error: '',
        isVisible: true,
        step: DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_START,
        twoFA: '',
      );

  DeliveryAgentSignUpState clone({
    String error = '',
    bool isVisible = true,
    DeliveryAgentSignUpStep step,
    String twoFA,
  }) {
    return DeliveryAgentSignUpState(
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      step: step ?? this.step,
      twoFA: twoFA ?? this.twoFA,
    );
  }
}
