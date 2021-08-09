import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:core';
part 'delivery_navigation_event.dart';
part 'delivery_navigation_state.dart';

class DeliveryNavigationBloc
    extends Bloc<DeliveryNavigationEvent, DeliveryNavigationState> {
  DeliveryNavigationBloc(BuildContext context)
      : super(DeliveryNavigationState.initialState);

  @override
  Stream<DeliveryNavigationState> mapEventToState(
    DeliveryNavigationEvent event,
  ) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: error, index: 0);
        break;
      case ChangeIndexEvent:
        final index = (event as ChangeIndexEvent).index;
        int newIndex = index == 0 ? 0 : 1;
        yield state.clone(error: '', index: newIndex);
        break;
    }
  }
}
