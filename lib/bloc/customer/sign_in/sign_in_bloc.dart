import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/customer/customerAPIProvider.dart';
import 'package:go_pharma/repos/customer/actual/customer/user.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class CustomerSignInBloc
    extends Bloc<CustomerSignInEvent, CustomerSignInState> {
  CustomerSignInBloc(BuildContext context)
      : super(CustomerSignInState.initialState);

  final UserAPIProvider _userAPIProvider = UserAPIProvider();

  @override
  Stream<CustomerSignInState> mapEventToState(
      CustomerSignInEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ToggleVisibility:
        final isVisible = (event as ToggleVisibility).isVisible;
        yield state.clone(isVisible: isVisible);
        break;
      case SignInCustomer:
        User user = await _userAPIProvider.getUser();
        print(user.firstName);
        print(user.lastName);
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
