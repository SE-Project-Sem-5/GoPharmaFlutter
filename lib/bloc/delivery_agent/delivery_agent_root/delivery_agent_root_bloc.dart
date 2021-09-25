import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_state.dart';
import 'package:go_pharma/repos/delivery_agent/user_delivery_agent/delivery_agent_model.dart';

class DeliveryAgentRootBloc
    extends Bloc<DeliveryAgentRootEvent, DeliveryAgentRootState> {
  DeliveryAgentRootBloc(BuildContext context)
      : super(DeliveryAgentRootState.initialState) {
    _init();
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
        final deliveryAgent = (event as UpdateUserEvent).deliveryAgent;
        yield state.clone(deliveryAgent: deliveryAgent);
        break;

      case StartInitCheckEvent:
        yield state.clone(initializing: true);
        break;

      case ChangeSignInStateEvent:
        final signInState = (event as ChangeSignInStateEvent).state;
        yield state.clone(signInState: signInState);
        break;

      case SignOutEvent:
        yield state.clone(signInState: DeliveryAgentRootSignInState.SIGNED_OUT);
        //TODO: Logic to sign out user
        break;

      case ToggleEditableEvent:
        yield state.clone(isEditable: !state.isEditable);
        break;

      case RootSignInEvent:
        final email = (event as RootSignInEvent).email;
        final password = (event as RootSignInEvent).password;
        DeliveryAgent deliveryAgent = new DeliveryAgent();
        yield state.clone(
          signInState: DeliveryAgentRootSignInState.SIGNED_IN,
          deliveryAgent: deliveryAgent,
        );
        break;
    }
  }

  Future<void> _init() async {
    add(StartInitCheckEvent());
    //TODO: init sign in automatically when app starts
    // Get email and password from shared prefs?
    // final auth = locator<AuthService>();
    // User user = await auth.createUserWithEmailAndPassword(email, password);
    add(UpdateUserEvent(new DeliveryAgent()));
    add(ChangeSignInStateEvent(DeliveryAgentRootSignInState.SIGNED_OUT));
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
