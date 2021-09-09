import 'package:flutter/material.dart';

@immutable
class DeliveryAgentSignInState {
  final String error;
  final bool isVisible;

  DeliveryAgentSignInState({
    required this.error,
    required this.isVisible,
  });

  static DeliveryAgentSignInState get initialState => DeliveryAgentSignInState(
        error: '',
        isVisible: false,
      );

  DeliveryAgentSignInState clone({
    String error = '',
    bool isVisible = false,
  }) {
    return DeliveryAgentSignInState(
      error: error,
      isVisible: isVisible,
    );
  }
}
