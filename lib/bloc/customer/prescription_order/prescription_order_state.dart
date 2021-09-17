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
  final bool isDistrictsLoading;
  final List<String> selectedDistricts;

  PrescriptionOrderState({
    this.error,
    this.localPhotoPaths,
    this.districts,
    this.step,
    this.isDistrictsLoading,
    this.selectedDistricts,
  });

  static PrescriptionOrderState get initialState => PrescriptionOrderState(
        error: '',
        localPhotoPaths: [],
        districts: ["All"],
        step: PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO,
        isDistrictsLoading: true,
        selectedDistricts: [],
      );

  PrescriptionOrderState clone({
    String error = '',
    List<String> localPhotoPaths,
    List<String> districts,
    PrescriptionOrderStep step,
    bool isDistrictsLoading,
    List<String> selectedDistricts,
  }) {
    return PrescriptionOrderState(
      error: error ?? this.error,
      localPhotoPaths: localPhotoPaths ?? this.localPhotoPaths,
      districts: districts ?? this.districts,
      step: step ?? this.step,
      isDistrictsLoading: isDistrictsLoading ?? this.isDistrictsLoading,
      selectedDistricts: selectedDistricts ?? this.selectedDistricts,
    );
  }
}
