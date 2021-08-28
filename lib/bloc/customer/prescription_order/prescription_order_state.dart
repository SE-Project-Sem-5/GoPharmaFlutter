import 'package:flutter/material.dart';

@immutable
class PrescriptionOrderState {
  final String error;
  final List<String> localPhotoPaths;

  PrescriptionOrderState({
    required this.error,
    required this.localPhotoPaths,
  });

  static PrescriptionOrderState get initialState => PrescriptionOrderState(
        error: '',
        localPhotoPaths: [],
      );

  PrescriptionOrderState clone({
    String error = '',
    required List<String> localPhotoPaths,
  }) {
    return PrescriptionOrderState(
      error: error,
      localPhotoPaths: localPhotoPaths,
    );
  }
}
