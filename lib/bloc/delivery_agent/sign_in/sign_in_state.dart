import 'package:flutter/material.dart';

@immutable
class DeliveryAgentSignInState {
  final String error;
  final bool isVisible;

  DeliveryAgentSignInState({
      this.error,
      this.isVisible,
  });

  static DeliveryAgentSignInState get initialState => DeliveryAgentSignInState(
        error: '',
        isVisible: true,
      );

  DeliveryAgentSignInState clone({
    String error = '',
    bool isVisible = true,
  }) {
    return DeliveryAgentSignInState(
      error: error,
      isVisible: isVisible,
    );
  }
}
