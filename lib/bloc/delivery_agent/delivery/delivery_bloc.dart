import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'delivery_state.dart';
import 'delivery_event.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  static List<DeliveryTransitionState> deliveryStates = [
    DeliveryTransitionState.SCHEDULED,
    DeliveryTransitionState.IN_TRANSIT,
    DeliveryTransitionState.DELIVERED,
    DeliveryTransitionState.PAID,
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
        final currentState = (event as NextDeliveryStatusEvent).currentState;
        final nextStateIndex = deliveryStates.indexOf(currentState) + 1;
        if (nextStateIndex < deliveryStates.length) {
          yield state.clone(
            error: '',
            orderTransitionState: deliveryStates[nextStateIndex],
          );
        } else {
          //  TODO: figure something out
        }
        break;
      case PreviousDeliveryStatusEvent:
        final currentState =
            (event as PreviousDeliveryStatusEvent).currentState;
        final previousStateIndex = deliveryStates.indexOf(currentState) - 1;
        if (previousStateIndex >= 0) {
          yield state.clone(
            error: '',
            orderTransitionState: deliveryStates[previousStateIndex],
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
