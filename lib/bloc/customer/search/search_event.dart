import 'package:flutter/material.dart';

@immutable
abstract class SearchEvent {}

class ProductSearchEvent extends SearchEvent {
  final String searchValue;
  ProductSearchEvent({
    this.searchValue,
  });
}

class ErrorEvent extends SearchEvent {
  final String error;

  ErrorEvent(this.error);
}

class UpdateFilterEvent extends SearchEvent {
  final String filter;

  UpdateFilterEvent(this.filter);
}
