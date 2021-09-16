import 'package:flutter/material.dart';

@immutable
class TestState {
  final String error;

  TestState({
      this.error,
  });

  static TestState get initialState => TestState(
        error: '',
      );

  TestState clone({
    String error = '',
  }) {
    return TestState(
      error: error,
    );
  }
}
