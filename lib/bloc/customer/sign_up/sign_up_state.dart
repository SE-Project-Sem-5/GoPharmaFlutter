import 'package:flutter/material.dart';

@immutable
class CustomerSignUpState {
  final String error;
  final bool isVisible;

  CustomerSignUpState({
    required this.error,
    required this.isVisible,
  });

  static CustomerSignUpState get initialState => CustomerSignUpState(
        error: '',
        isVisible: true,
      );

  CustomerSignUpState clone({
    String error = '',
    bool isVisible = true,
  }) {
    return CustomerSignUpState(
      error: error,
      isVisible: isVisible,
    );
  }
}
