import 'package:flutter/material.dart';

@immutable
class TextFieldState {
  final String error;
  final bool isVisible;

  TextFieldState({
    required this.error,
    required this.isVisible,
  });

  static TextFieldState get initialState => TextFieldState(
        error: '',
        isVisible: false,
      );

  TextFieldState clone({
    String error = '',
    bool isVisible = false,
  }) {
    return TextFieldState(
      error: error,
      isVisible: isVisible,
    );
  }
}
