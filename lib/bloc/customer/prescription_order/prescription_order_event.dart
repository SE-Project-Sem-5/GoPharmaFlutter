import 'package:flutter/material.dart';

@immutable
abstract class PrescriptionOrderEvent {}

class ErrorEvent extends PrescriptionOrderEvent {
  final String error;

  ErrorEvent(this.error);
}

class UploadPrescriptionFromGallery extends PrescriptionOrderEvent {
  final List<String> localPhotoPaths;
  UploadPrescriptionFromGallery({required this.localPhotoPaths});
}
