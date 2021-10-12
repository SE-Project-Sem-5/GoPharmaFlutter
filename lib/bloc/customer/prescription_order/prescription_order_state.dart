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
  final String orderID;

  PrescriptionOrderState({
    this.orderLoading = false,
    this.photos,
    this.orderID,
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
        orderID: "",
      );

  PrescriptionOrderState clone({
    String error = '',
    List<String> localPhotoPaths,
    List<File> photos,
    String zone,
    PrescriptionOrderStep step,
    String orderID,
    bool orderLoading,
  }) {
    return PrescriptionOrderState(
      error: error ?? this.error,
      localPhotoPaths: localPhotoPaths ?? this.localPhotoPaths,
      zone: zone ?? this.zone,
      orderID: orderID ?? this.orderID,
      step: step ?? this.step,
      photos: photos ?? this.photos,
      orderLoading: orderLoading ?? this.orderLoading,
    );
  }
}
