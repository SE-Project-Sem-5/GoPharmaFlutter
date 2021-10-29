import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_state.dart';
import 'package:go_pharma/repos/common/signup/userAPIProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryAgentRootBloc
    extends Bloc<DeliveryAgentRootEvent, DeliveryAgentRootState> {
  final UserAPIProvider userApiProvider = new UserAPIProvider();
  DeliveryAgentRootBloc(BuildContext context)
      : super(DeliveryAgentRootState.initialState) {
    _init();
  }
  Future<void> _init() async {
    var prefs = await SharedPreferences.getInstance();
    print("Loading");
    final cookie = (prefs.getString('cookie') ?? '');
    print("cookie: " + cookie);
    if (cookie != '') {
      print("Looking for access token");
      print(cookie);
      Map<String, dynamic> result =
          await userApiProvider.getCurrentUser(cookie);
      if (result.containsKey("user")) {
        add(
          UpdateUserEvent(
            result["user"],
          ),
        );
        prefs.setString('cookie', result["cookie"]);
      }
    } else {
      prefs.setString('cookie', "");
      add(
        ChangeSignInStateEvent(
          DeliveryAgentRootSignInState.SIGNED_OUT,
        ),
      );
    }
  }

  @override
  Stream<DeliveryAgentRootState> mapEventToState(
      DeliveryAgentRootEvent event) async* {
    switch (event.runtimeType) {
      case RootErrorEvent:
        final error = (event as RootErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case UpdateUserEvent:
        final user = (event as UpdateUserEvent).user;
        yield state.clone(
          user: user,
        );
        break;
      case ChangeSignInStateEvent:
        final signInState = (event as ChangeSignInStateEvent).state;
        yield state.clone(signInState: signInState);
        break;

      case ToggleEditableEvent:
        yield state.clone(
            isGeneralInformationEditable: !state.isGeneralInformationEditable);
        break;
      case ToggleVisibility:
        final isVisible = (event as ToggleVisibility).isVisible;
        yield state.clone(isVisible: isVisible);
        break;
      case ToggleGeneralInformationEditableEvent:
        yield state.clone(
          isGeneralInformationEditable: !state.isGeneralInformationEditable,
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
      add(RootErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(RootErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
