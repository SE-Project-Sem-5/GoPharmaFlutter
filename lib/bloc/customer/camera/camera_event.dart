import 'package:flutter/material.dart';

@immutable
abstract class CameraEvent {}

class ErrorEvent extends CameraEvent {
  final String error;

  ErrorEvent(this.error);
}

class UploadImageFromGallery extends CameraEvent {
  final List<String> localPhotoPaths;
  UploadImageFromGallery({required this.localPhotoPaths});
}

class CameraStoppedEvent extends CameraEvent {}

class PhotoCapturedEvent extends CameraEvent {}
