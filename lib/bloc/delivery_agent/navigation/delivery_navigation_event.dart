part of 'delivery_navigation_bloc.dart';

@immutable
abstract class DeliveryNavigationEvent {}

class ErrorEvent extends DeliveryNavigationEvent {
  final String error;

  ErrorEvent(this.error);
}

class ChangeIndexEvent extends DeliveryNavigationEvent {
  final int index;

  ChangeIndexEvent(this.index);
}
