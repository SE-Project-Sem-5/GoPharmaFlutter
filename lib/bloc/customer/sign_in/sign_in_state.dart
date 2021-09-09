import 'package:flutter/material.dart';

@immutable
class SignInState {
  final String error;
  final bool isVisible;

  SignInState({
    required this.error,
    required this.isVisible,
  });

  static SignInState get initialState => SignInState(
        error: '',
        isVisible: false,
      );

  SignInState clone({
    String error = '',
    bool isVisible = false,
  }) {
    return SignInState(
      error: error,
      isVisible: isVisible,
    );
  }
}
