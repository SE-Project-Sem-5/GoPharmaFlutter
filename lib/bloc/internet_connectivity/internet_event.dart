import 'package:flutter/material.dart';

enum Connection { WIFI, MOBILE_DATA, DISCONNECTED }

@immutable
abstract class InternetEvent {}

class ConnectionEvent extends InternetEvent {
  final Connection connection;
  ConnectionEvent({this.connection});
}

class ErrorEvent extends InternetEvent {
  final String error;

  ErrorEvent(this.error);
}

class DisconnectionEvent extends InternetEvent {
  final Connection connection;

  DisconnectionEvent({this.connection});
}
