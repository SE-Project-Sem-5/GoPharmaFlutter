import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/orderInProgress/orderResponse.dart';
import 'package:go_pharma/repos/customer/actual/prescription_order/prescriptionOrder.dart';
import 'package:go_pharma/repos/customer/actual/prescription_order/prescriptionOrderAPIProvider.dart';
import 'package:go_pharma/ui/customer/customer_home_page.dart';

import 'prescription_order_event.dart';
import 'prescription_order_state.dart';

class PrescriptionOrderBloc
    extends Bloc<PrescriptionOrderEvent, PrescriptionOrderState> {
  PrescriptionOrderAPIProvider prescriptionOrderAPIProvider =
      new PrescriptionOrderAPIProvider();

  static List<PrescriptionOrderStep> stepOrder = [
    PrescriptionOrderStep.PRESCRIPTIONORDER_PHOTO,
    PrescriptionOrderStep.PRESCRIPTIONORDER_ZONE,
    PrescriptionOrderStep.PRESCRIPTIONORDER_SUMMARY,
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
      case UploadPrescriptionEvent:
        final String image = (event as UploadPrescriptionEvent).image;
        final List<String> newLocalPhotoPaths = state.localPhotoPaths;
        final List<File> photos = state.photos;
        newLocalPhotoPaths.add(image);
        photos.add(File(image));
        yield state.clone(
          localPhotoPaths: newLocalPhotoPaths,
          photos: photos,
        );
        break;
      case SelectZoneEvent:
        final String zone = (event as SelectZoneEvent).zone;
        yield state.clone(
          zone: zone,
        );
        break;
      case RemoveImageEvent:
        final String image = (event as RemoveImageEvent).image;
        final List<String> localPhotoPaths = state.localPhotoPaths;
        final List<File> photos = state.photos;
        photos.remove(File(image));
        localPhotoPaths.remove(image);
        yield state.clone(
          localPhotoPaths: localPhotoPaths,
          photos: photos,
        );
        break;
      case ConfirmOrderEvent:
        yield state.clone(orderLoading: true);
        PrescriptionOrder prescriptionOrder = new PrescriptionOrder(
          zone: state.zone.toLowerCase(),
        );
        print(state.localPhotoPaths);
        OrderResponse response =
            await prescriptionOrderAPIProvider.confirmPrescriptionOrder(
          prescriptionOrder,
          state.localPhotoPaths,
        );
        print(response);
        print(response.orderID);
        if (response.orderID != null) {
          yield state.clone(
            orderLoading: false,
            orderID: response.orderID.toString(),
          );
        }
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
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacementNamed(context, CustomerHomePage.id);
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
