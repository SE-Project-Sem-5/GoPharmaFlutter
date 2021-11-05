import 'package:flutter/material.dart';

@immutable
abstract class SearchEvent {}

class ProductSearchEvent extends SearchEvent {
  final String filter;
  final String searchValue;
  ProductSearchEvent({
    this.filter,
    this.searchValue,
  });
}

class ErrorEvent extends SearchEvent {
  final String error;

  ErrorEvent(this.error);
}
