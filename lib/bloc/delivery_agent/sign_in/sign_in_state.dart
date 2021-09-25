import 'package:flutter/material.dart';

enum DeliveryAgentSignInStep {
  DELIVERYAGENTSIGNINSTEP_START,
  DELIVERYAGENTSIGNINSTEP_2FA
}

@immutable
class DeliveryAgentSignInState {
  final String error;
  final bool isVisible;
  final DeliveryAgentSignInStep step;
  final String twoFA;

  DeliveryAgentSignInState({
    this.twoFA,
    this.error,
    this.step,
    this.isVisible,
  });

  static DeliveryAgentSignInState get initialState => DeliveryAgentSignInState(
        error: '',
        isVisible: true,
        step: DeliveryAgentSignInStep.DELIVERYAGENTSIGNINSTEP_START,
        twoFA: '',
      );

  DeliveryAgentSignInState clone({
    String error = '',
    bool isVisible = true,
    DeliveryAgentSignInStep step,
    String twoFA,
  }) {
    return DeliveryAgentSignInState(
      error: error ?? this.error,
      isVisible: isVisible ?? this.isVisible,
      step: step ?? this.step,
      twoFA: twoFA ?? this.twoFA,
    );
  }
}
