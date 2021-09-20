import 'package:flutter/material.dart';

@immutable
class NormalOrderState {
  final String error;

  NormalOrderState({
    this.error,
  });

  static NormalOrderState get initialState => NormalOrderState(
        error: '',
      );

  NormalOrderState clone({
    String error = '',
  }) {
    return NormalOrderState(
      error: error,
    );
  }
}
