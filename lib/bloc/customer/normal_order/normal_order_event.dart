import 'package:flutter/material.dart';

@immutable
abstract class NormalOrderEvent {}

class ErrorEvent extends NormalOrderEvent {
  final String error;

  ErrorEvent(this.error);
}
