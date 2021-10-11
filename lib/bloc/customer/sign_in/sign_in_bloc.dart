import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_event.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_state.dart';
import 'package:go_pharma/repos/customer/actual/customer/customerAPIProvider.dart';
import 'package:go_pharma/repos/customer/actual/customer/user.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';

class CustomerSignInBloc
    extends Bloc<CustomerSignInEvent, CustomerSignInState> {
  static List<CustomerSignInStep> stepOrder = [
    CustomerSignInStep.CUSTOMERSIGNINSTEP_START,
    CustomerSignInStep.CUSTOMERSIGNINSTEP_2FA,
  ];
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
      case UpdateTwoFA:
        final twoFA = (event as UpdateTwoFA).twoFA;
        yield state.clone(
          twoFA: twoFA,
        );
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
          //  TODO: adjust
          Navigator.pushReplacementNamed(
            context,
            CustomerHomePage.id,
          );
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
