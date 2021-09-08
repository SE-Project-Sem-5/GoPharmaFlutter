part of 'delivery_navigation_bloc.dart';

@immutable
class DeliveryNavigationState {
  final String error;
  final String title;
  final int index;

  DeliveryNavigationState({
    required this.error,
    required this.index,
    required this.title,
  });

  static DeliveryNavigationState get initialState => DeliveryNavigationState(
        error: '',
        index: 0,
        title: "Deliveries",
      );

  DeliveryNavigationState clone({
    String error = '',
    String title = "Deliveries",
    required int index,
  }) {
    return DeliveryNavigationState(
      error: error,
      title: title,
      index: index,
    );
  }
}
