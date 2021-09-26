part of 'delivery_navigation_bloc.dart';

@immutable
class DeliveryNavigationState {
  final String error;
  final String title;
  final int index;

  DeliveryNavigationState({
    this.error,
    this.index,
    this.title,
  });

  static DeliveryNavigationState get initialState => DeliveryNavigationState(
        error: '',
        index: 0,
        title: "Deliveries",
      );

  DeliveryNavigationState clone({
    String error,
    String title,
    int index,
  }) {
    return DeliveryNavigationState(
      error: error ?? this.error,
      title: title ?? this.title,
      index: index ?? this.index,
    );
  }
}
