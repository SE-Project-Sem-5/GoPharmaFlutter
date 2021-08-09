import 'package:flutter/material.dart';

@immutable
class TestState {
  final String error;

  TestState({
    required this.error,
  });

  static TestState get initialState => TestState(
        error: '',
      );

  TestState clone({
    String error = '',
  }) {
    return TestState(
      error: error ?? this.error,
    );
  }
}
