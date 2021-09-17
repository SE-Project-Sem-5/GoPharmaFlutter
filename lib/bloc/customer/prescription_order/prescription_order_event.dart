import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';

@immutable
abstract class PrescriptionOrderEvent {}

class ErrorEvent extends PrescriptionOrderEvent {
  final String error;

  ErrorEvent(this.error);
}

class UploadPrescriptionFromGalleryEvent extends PrescriptionOrderEvent {
  final List<String> localPhotoPaths;
  UploadPrescriptionFromGalleryEvent({this.localPhotoPaths});
}

class SelectDistrictEvent extends PrescriptionOrderEvent {
  final List<String> districts;

  SelectDistrictEvent({this.districts});
}

class LoadDistrictsEvent extends PrescriptionOrderEvent {
  final List<String> districts;
  final bool isLoadingDistricts;
  LoadDistrictsEvent({this.districts, this.isLoadingDistricts});
}

class NextStepEvent extends PrescriptionOrderEvent {
  final PrescriptionOrderStep currentStep;
  NextStepEvent({this.currentStep});
}

class PreviousStepEvent extends PrescriptionOrderEvent {
  final PrescriptionOrderStep currentStep;
  final BuildContext context;
  PreviousStepEvent({this.currentStep, this.context});
}
