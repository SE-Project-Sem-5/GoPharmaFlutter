import 'package:flutter/material.dart';

@immutable
class DeliveryAgentSignUpState {
  final String error;
  final bool isVisible;

  DeliveryAgentSignUpState({
      this.error,
      this.isVisible,
  });

  static DeliveryAgentSignUpState get initialState => DeliveryAgentSignUpState(
        error: '',
        isVisible: true,
      );

  DeliveryAgentSignUpState clone({
    String error = '',
    bool isVisible = true,
  }) {
    return DeliveryAgentSignUpState(
      error: error,
      isVisible: isVisible,
    );
  }
}
