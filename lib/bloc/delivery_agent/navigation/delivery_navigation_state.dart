part of 'delivery_navigation_bloc.dart';

@immutable
class DeliveryNavigationState {
  final String error;
  final int index;

  DeliveryNavigationState({
    required this.error,
    required this.index,
  });

  static DeliveryNavigationState get initialState => DeliveryNavigationState(
        error: '',
        index: 0,
      );

  DeliveryNavigationState clone({
    String error = '',
    required int index,
  }) {
    return DeliveryNavigationState(
      error: error,
      index: index,
    );
  }
}
