import 'package:flutter/material.dart';

@immutable
class CustomerSignInState {
  final String error;
  final bool isVisible;

  CustomerSignInState({
      this.error,
      this.isVisible,
  });

  static CustomerSignInState get initialState => CustomerSignInState(
        error: '',
        isVisible: true,
      );

  CustomerSignInState clone({
    String error = '',
    bool isVisible = true,
  }) {
    return CustomerSignInState(
      error: error,
      isVisible: isVisible,
    );
  }
}
