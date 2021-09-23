import 'dart:io';

import 'package:flutter/material.dart';

enum PrescriptionOrderStep {
  PRESCRIPTIONORDER_PHOTO,
  PRESCRIPTIONORDER_ZONE,
  PRESCRIPTIONORDER_SUMMARY
}

@immutable
class PrescriptionOrderState {
  final String error;
  final List<String> localPhotoPaths;
  final String zone;
  final PrescriptionOrderStep step;
  final List<File> photos;
  final bool orderLoading;

  PrescriptionOrderState({
    this.orderLoading = false,
    this.photos,
    this.error,
    this.localPhotoPaths,
    this.zone = "city",
    this.step,
  });

  static PrescriptionOrderState get initialState => PrescriptionOrderState(
        error: '',
        localPhotoPaths: [],
        zone: "city",
        step: PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO,
        photos: [],
        orderLoading: false,
      );

  PrescriptionOrderState clone({
    String error = '',
    List<String> localPhotoPaths,
    List<File> photos,
    String zone,
    PrescriptionOrderStep step,
    bool orderLoading,
  }) {
    return PrescriptionOrderState(
      error: error ?? this.error,
      localPhotoPaths: localPhotoPaths ?? this.localPhotoPaths,
      zone: zone ?? this.zone,
      step: step ?? this.step,
      photos: photos ?? this.photos,
      orderLoading: orderLoading ?? this.orderLoading,
    );
  }
}
