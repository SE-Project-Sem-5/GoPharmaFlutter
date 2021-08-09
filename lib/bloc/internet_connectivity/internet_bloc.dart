import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_event.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_state.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;
  InternetBloc(BuildContext context, this.connectivity)
      : super(InternetState.initialState) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        add(ConnectionEvent(connection: Connection.WIFI));
      } else if (connectivityResult == ConnectivityResult.mobile) {
        add(ConnectionEvent(connection: Connection.MOBILE_DATA));
      } else {
        add(ConnectionEvent(connection: Connection.DISCONNECTED));
      }
    });
  }

  Future<void> _init() async {}

  @override
  Stream<InternetState> mapEventToState(InternetEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ConnectionEvent:
        final connection = (event as ConnectionEvent).connection;
        yield state.clone(
          error: '',
          connection: connection,
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
    connectivityStreamSubscription!.cancel();
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
