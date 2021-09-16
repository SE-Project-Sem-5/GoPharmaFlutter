import 'package:flutter/material.dart';

enum PrescriptionOrderStep {
  PRESCRIPTIONORDER_PHOTO,
  PRESCRIPTIONORDER_DISTRICT,
}

@immutable
class PrescriptionOrderState {
  final String error;
  final List<String> localPhotoPaths;
  //TODO: if it says all, it means all districts? check implementation
  final List<String> districts;
  final PrescriptionOrderStep step;

  PrescriptionOrderState({
    @required this.error,
    @required this.localPhotoPaths,
    @required this.districts,
    @required this.step,
  });

  static PrescriptionOrderState get initialState => PrescriptionOrderState(
        error: '',
        localPhotoPaths: [],
        districts: [],
        step: PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO,
      );

  PrescriptionOrderState clone({
    String error = '',
    @required List<String> localPhotoPaths,
    @required List<String> districts,
    @required PrescriptionOrderStep step,
  }) {
    return PrescriptionOrderState(
      error: error,
      localPhotoPaths: localPhotoPaths,
      districts: districts,
      step: step,
    );
  }
}
