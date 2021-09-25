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

  DeliveryAgentSignUpState({
    this.error,
    this.isVisible,
    this.step,
  });

  static DeliveryAgentSignUpState get initialState => DeliveryAgentSignUpState(
        error: '',
        isVisible: true,
        step: DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_START,
      );

  DeliveryAgentSignUpState clone({
    String error = '',
    bool isVisible = true,
    DeliveryAgentSignUpStep step,
  }) {
    return DeliveryAgentSignUpState(
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      step: step ?? this.step,
    );
  }
}
