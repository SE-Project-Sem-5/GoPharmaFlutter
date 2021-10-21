import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/user.dart';

class CustomerRootBloc extends Bloc<CustomerRootEvent, CustomerRootState> {
  CustomerRootBloc(BuildContext context)
      : super(CustomerRootState.initialState) {
    _init();
  }

  Future<void> _init() async {
    add(StartInitCheckEvent());
    add(UpdateUserEvent(new User()));
    add(ChangeSignInStateEvent(CustomerRootSignInState.SIGNED_OUT));
  }

  @override
  Stream<CustomerRootState> mapEventToState(CustomerRootEvent event) async* {
    switch (event.runtimeType) {
      case RootErrorEvent:
        final error = (event as RootErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case UpdateUserEvent:
        final user = (event as UpdateUserEvent).user;
        yield state.clone(user: user);
        break;
      case StartInitCheckEvent:
        yield state.clone(initializing: true);
        break;
      case ChangeSignInStateEvent:
        final signInState = (event as ChangeSignInStateEvent).state;
        yield state.clone(signInState: signInState);
        break;
      case SignOutEvent:
        yield state.clone(signInState: CustomerRootSignInState.SIGNED_OUT);
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
