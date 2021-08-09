import 'package:flutter/material.dart';

@immutable
abstract class testEvent {}

class ErrorEvent extends testEvent {
  final String error;

  ErrorEvent(this.error);
}
