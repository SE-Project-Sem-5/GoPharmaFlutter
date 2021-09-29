import 'package:flutter/material.dart';

@immutable
abstract class PendingOrderEvent {}

class ErrorEvent extends PendingOrderEvent {
  final String error;

  ErrorEvent(this.error);
}

class LoadAllCategories extends PendingOrderEvent {
  LoadAllCategories();
}
