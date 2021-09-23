import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';

@immutable
abstract class PrescriptionOrderEvent {}

class ErrorEvent extends PrescriptionOrderEvent {
  final String error;
  ErrorEvent(this.error);
}

class UploadPrescriptionEvent extends PrescriptionOrderEvent {
  final String image;
  UploadPrescriptionEvent({this.image});
}

class ConfirmOrderEvent extends PrescriptionOrderEvent {
  ConfirmOrderEvent();
}

class RemoveImageEvent extends PrescriptionOrderEvent {
  final String image;
  RemoveImageEvent({this.image});
}

class SelectZoneEvent extends PrescriptionOrderEvent {
  final String zone;

  SelectZoneEvent({this.zone});
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
