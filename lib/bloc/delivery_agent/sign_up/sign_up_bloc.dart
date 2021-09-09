import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class DeliveryAgentSignUpBloc
    extends Bloc<DeliveryAgentSignUpEvent, DeliveryAgentSignUpState> {
  DeliveryAgentSignUpBloc(BuildContext context)
      : super(DeliveryAgentSignUpState.initialState);

  @override
  Stream<DeliveryAgentSignUpState> mapEventToState(
      DeliveryAgentSignUpEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ToggleVisibility:
        final isVisible = (event as ToggleVisibility).isVisible;
        yield state.clone(isVisible: isVisible);
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
