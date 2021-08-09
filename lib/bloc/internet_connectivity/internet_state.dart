import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_event.dart';

@immutable
class InternetState {
  final String error;
  final Connection connection;

  InternetState({
    required this.connection,
    required this.error,
  });

  static InternetState get initialState =>
      InternetState(error: '', connection: Connection.DISCONNECTED);

  InternetState clone({
    String error = '',
    Connection connection = Connection.DISCONNECTED,
  }) {
    return InternetState(
      error: error,
      connection: connection,
    );
  }
}
