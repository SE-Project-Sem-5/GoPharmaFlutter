import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/location/location_api_provider.dart';

import 'prescription_order_event.dart';
import 'prescription_order_state.dart';

class PrescriptionOrderBloc
    extends Bloc<PrescriptionOrderEvent, PrescriptionOrderState> {
  final LocationApiProvider locationApiProvider = LocationApiProvider();

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
        );
        yield state.clone(
          error: error,
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
        );
        break;
      case SelectDistrictEvent:
        //TODO: Add a select all option
        final String selectedDistrict =
            (event as SelectDistrictEvent).selectedDistrict;
        List<String> selectedDistricts = state.selectedDistricts;
        if (selectedDistricts.contains(selectedDistrict)) {
          selectedDistricts.remove(selectedDistrict);
        } else {
          selectedDistricts.add(selectedDistrict);
        }
        yield state.clone(
          selectedDistricts: selectedDistricts,
        );

        break;
      case LoadDistrictsEvent:
        yield state.clone(
          isDistrictsLoading: true,
        );
        try {
          List<String> districts = await locationApiProvider.getDistricts();
          districts.sort();
          if (districts != []) {
            yield state.clone(
              districts: districts,
              isDistrictsLoading: false,
            );
          } else {
            print("Error");
            yield state.clone(
              error: "Error occured",
              isDistrictsLoading: true,
            );
          }
        } catch (error, stacktrace) {
          print("Exception occured: $error stackTrace: $stacktrace");
          yield state.clone(
            error: error,
          );
        }
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
