import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class DeliveryAgentSignUpBloc
    extends Bloc<DeliveryAgentSignUpEvent, DeliveryAgentSignUpState> {
  static List<DeliveryAgentSignUpStep> stepOrder = [
    DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_START,
    DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_INFORMATION,
    DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_2FA,
  ];

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
        final isVisible = state.isVisible;
        yield state.clone(isVisible: !isVisible);
        break;
      case NextStepEvent:
        final currentStep = (event as NextStepEvent).currentStep;
        final nextIndex = stepOrder.indexOf(currentStep) + 1;
        if (nextIndex < stepOrder.length) {
          yield state.clone(
            step: stepOrder[nextIndex],
          );
        } else {
          //TODO: Event to do something after the flow ends
          //add();
        }
        break;
      case PreviousStepEvent:
        final currentStep = (event as PreviousStepEvent).currentStep;
        final context = (event as PreviousStepEvent).context;
        final prevIndex = stepOrder.indexOf(currentStep) - 1;
        if (prevIndex >= 0) {
          yield state.clone(
            step: stepOrder[prevIndex],
          );
        } else {
          Navigator.pop(context);
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
