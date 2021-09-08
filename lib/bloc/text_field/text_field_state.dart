import 'package:flutter/material.dart';

@immutable
class TextFieldState {
  final String error;

  TextFieldState({
    required this.error,
  });

  static TextFieldState get initialState => TextFieldState(
        error: '',
      );

  TextFieldState clone({
    String error = '',
  }) {
    return TextFieldState(
      error: error,
    );
  }
}
