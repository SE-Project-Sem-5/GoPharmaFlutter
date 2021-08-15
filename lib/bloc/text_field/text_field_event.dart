import 'package:flutter/material.dart';

@immutable
abstract class TextFieldEvent {}

class ErrorEvent extends TextFieldEvent {
  final String error;

  ErrorEvent(this.error);
}
