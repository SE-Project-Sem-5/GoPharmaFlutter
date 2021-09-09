import 'package:flutter/material.dart';

@immutable
class CustomerSignInState {
  final String error;
  final bool isVisible;

  CustomerSignInState({
    required this.error,
    required this.isVisible,
  });

  static CustomerSignInState get initialState => CustomerSignInState(
        error: '',
        isVisible: false,
      );

  CustomerSignInState clone({
    String error = '',
    bool isVisible = false,
  }) {
    return CustomerSignInState(
      error: error,
      isVisible: isVisible,
    );
  }
}
