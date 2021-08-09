import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/camera/camera_event.dart';

import 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc(BuildContext context) : super(CameraState.initialState);

  @override
  Stream<CameraState> mapEventToState(CameraEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "", localPhotoPaths: []);
        yield state.clone(error: error, localPhotoPaths: []);
        break;
      case UploadImageFromGallery:
        final List<String> localPhotoPaths =
            (event as UploadImageFromGallery).localPhotoPaths;
        final List<String> newLocalPhotoPaths = state.localPhotoPaths;
        for (String i in localPhotoPaths) {
          newLocalPhotoPaths.insert(0, i);
        }
        yield state.clone(
          localPhotoPaths: newLocalPhotoPaths,
        );
        break;
      case PhotoCapturedEvent:
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
