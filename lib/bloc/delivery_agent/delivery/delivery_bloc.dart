import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'delivery_state.dart';
import 'delivery_event.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  static List<DeliveryTransitionState> deliveryStates = [
    DeliveryTransitionState.CONFIRMED,
    DeliveryTransitionState.COLLECTED,
    DeliveryTransitionState.TRANSIENT,
    DeliveryTransitionState.SHIPPED,
    DeliveryTransitionState.DELIVERED,
    //  TODO: need to differentiate between cash on delivery and online
  ];
  DeliveryBloc(BuildContext context) : super(DeliveryState.initialState);

  @override
  Stream<DeliveryState> mapEventToState(DeliveryEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case NextDeliveryStatusEvent:
        final delivery = (event as NextDeliveryStatusEvent).delivery;
        delivery.nextDeliveryStatus();
        final nextStateIndex = delivery.deliveryStatusIndex;
        if (nextStateIndex < deliveryStates.length) {
          yield state.clone(
            orderTransitionState: deliveryStates[nextStateIndex],
            state: delivery.deliveryStatus,
          );
        } else {
          //  TODO: figure something out
        }
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
