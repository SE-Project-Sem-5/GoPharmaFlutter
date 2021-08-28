import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'prescription_order_event.dart';
import 'prescription_order_state.dart';

class PrescriptionOrderBloc
    extends Bloc<PrescriptionOrderEvent, PrescriptionOrderState> {
  PrescriptionOrderBloc(BuildContext context)
      : super(PrescriptionOrderState.initialState);

  @override
  Stream<PrescriptionOrderState> mapEventToState(
      PrescriptionOrderEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "", localPhotoPaths: []);
        yield state.clone(error: error, localPhotoPaths: []);
        break;
      case UploadPrescriptionFromGallery:
        final List<String> localPhotoPaths =
            (event as UploadPrescriptionFromGallery).localPhotoPaths;
        final List<String> newLocalPhotoPaths = state.localPhotoPaths;
        for (String i in localPhotoPaths) {
          newLocalPhotoPaths.insert(0, i);
        }
        yield state.clone(
          localPhotoPaths: newLocalPhotoPaths,
        );
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
