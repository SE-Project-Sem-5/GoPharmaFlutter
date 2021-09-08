import 'package:flutter/material.dart';

@immutable
abstract class TestEvent {}

class ErrorEvent extends TestEvent {
  final String error;

  ErrorEvent(this.error);
}
