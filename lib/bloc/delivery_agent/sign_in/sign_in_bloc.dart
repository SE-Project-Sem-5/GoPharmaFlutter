import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_deliveries_page.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class DeliveryAgentSignInBloc
    extends Bloc<DeliveryAgentSignInEvent, DeliveryAgentSignInState> {
  static List<DeliveryAgentSignInStep> stepOrder = [
    DeliveryAgentSignInStep.DELIVERYAGENTSIGNINSTEP_START,
    DeliveryAgentSignInStep.DELIVERYAGENTSIGNINSTEP_2FA,
  ];
  DeliveryAgentSignInBloc(BuildContext context)
      : super(DeliveryAgentSignInState.initialState);

  @override
  Stream<DeliveryAgentSignInState> mapEventToState(
      DeliveryAgentSignInEvent event) async* {
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
      case NextStepEvent:
        final currentStep = (event as NextStepEvent).currentStep;
        final context = (event as NextStepEvent).context;
        final nextIndex = stepOrder.indexOf(currentStep) + 1;
        if (nextIndex < stepOrder.length) {
          yield state.clone(
            step: stepOrder[nextIndex],
          );
        } else {
          Navigator.pushNamed(
            context,
            PendingDeliveriesPage.id,
          );
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
