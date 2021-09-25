import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/customer/dummy/user_customer/customer_model.dart';

class CustomerRootBloc extends Bloc<CustomerRootEvent, CustomerRootState> {
  CustomerRootBloc(BuildContext context)
      : super(CustomerRootState.initialState) {
    _init();
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
        final customer = (event as UpdateUserEvent).customer;
        yield state.clone(customer: customer);
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
        //TODO: Logic to sign out user
        break;

      case ToggleEditableEvent:
        yield state.clone(isEditable: !state.isEditable);
        break;

      case RootSignInEvent:
        final email = (event as RootSignInEvent).email;
        final password = (event as RootSignInEvent).password;

        // TODO: Logic to sign in user
        // final auth = locator<AuthService>();
        // User user = await auth.createUserWithEmailAndPassword(email, password);
        Customer customer = new Customer();
        yield state.clone(
          signInState: CustomerRootSignInState.SIGNED_IN,
          customer: customer,
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
    add(UpdateUserEvent(new Customer()));
    add(ChangeSignInStateEvent(CustomerRootSignInState.SIGNED_OUT));
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
