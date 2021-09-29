import 'package:flutter/material.dart';

@immutable
abstract class CategoryEvent {}

class ErrorEvent extends CategoryEvent {
  final String error;

  ErrorEvent(this.error);
}

class LoadAllCategories extends CategoryEvent {
  LoadAllCategories();
}
