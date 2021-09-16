import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'prescription_order_event.dart';
import 'prescription_order_state.dart';

class PrescriptionOrderBloc
    extends Bloc<PrescriptionOrderEvent, PrescriptionOrderState> {
  static List<PrescriptionOrderStep> stepOrder = [
    PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO,
    PrescriptionOrderStep.PRESCRIPTIONORDER_DISTRICT,
  ];

  PrescriptionOrderBloc(BuildContext context)
      : super(PrescriptionOrderState.initialState);

  @override
  Stream<PrescriptionOrderState> mapEventToState(
      PrescriptionOrderEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(
          error: "",
          localPhotoPaths: [],
          districts: [],
          step: state.step,
        );
        yield state.clone(
          error: error,
          localPhotoPaths: [],
          districts: [],
          step: state.step,
        );
        break;
      case UploadPrescriptionFromGalleryEvent:
        final List<String> localPhotoPaths =
            (event as UploadPrescriptionFromGalleryEvent).localPhotoPaths;
        final List<String> newLocalPhotoPaths = state.localPhotoPaths;
        for (String i in localPhotoPaths) {
          newLocalPhotoPaths.insert(0, i);
        }
        yield state.clone(
          localPhotoPaths: newLocalPhotoPaths,
          districts: [],
          step: state.step,
        );
        break;
      case SelectDistrictEvent:
        final List<String> districts = (event as SelectDistrictEvent).districts;
        yield state.clone(
          localPhotoPaths: state.localPhotoPaths,
          districts: districts,
          step: state.step,
        );
        break;
      case NextStepEvent:
        final currentStep = (event as NextStepEvent).currentStep;
        final nextIndex = stepOrder.indexOf(currentStep) + 1;
        if (nextIndex < stepOrder.length) {
          yield state.clone(
            step: stepOrder[nextIndex],
            localPhotoPaths: state.localPhotoPaths,
            districts: state.districts,
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
            localPhotoPaths: state.localPhotoPaths,
            districts: state.districts,
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
