import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/repos/common/signup/userAPIProvider.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class CustomerSignUpBloc
    extends Bloc<CustomerSignUpEvent, CustomerSignUpState> {
  UserAPIProvider userAPIProvider = new UserAPIProvider();
  static List<CustomerSignUpStep> stepOrder = [
    CustomerSignUpStep.CUSTOMERSIGNUPSTEP_START,
    CustomerSignUpStep.CUSTOMERSIGNUPSTEP_INFORMATION,
    CustomerSignUpStep.CUSTOMERSIGNUPSTEP_2FA,
  ];

  CustomerSignUpBloc(BuildContext context)
      : super(CustomerSignUpState.initialState);

  @override
  Stream<CustomerSignUpState> mapEventToState(
      CustomerSignUpEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ToggleVisibility:
        final isVisible = state.isVisible;
        yield state.clone(isVisible: !isVisible);
        break;
      case SignUpStep1:
        yield state.clone(
          isLoading: true,
        );
        final email = (event as SignUpStep1).email;
        final password = (event as SignUpStep1).password;
        final Map<String, String> result = await userAPIProvider.signUpUser(
          email,
          password,
          "customer",
        );
        if (result.containsKey("success")) {
          yield state.clone(
            isLoading: false,
            email: email,
            password: password,
          );
        } else {
          yield state.clone(
            isLoading: false,
            error: result["error"],
          );
        }
        break;
      case CustomerSignUpStep2:
        yield state.clone(
          isLoading: true,
        );
        final firstName = (event as CustomerSignUpStep2).firstName;
        final lastName = (event as CustomerSignUpStep2).lastName;
        final streetAddress = (event as CustomerSignUpStep2).streetAddress;
        final city = (event as CustomerSignUpStep2).city;
        final district = (event as CustomerSignUpStep2).district;
        final province = (event as CustomerSignUpStep2).province;
        final birthDate = (event as CustomerSignUpStep2).birthDate;
        final gender = (event as CustomerSignUpStep2).gender;
        final contactNumber = (event as CustomerSignUpStep2).contactNumber;
        final result = await userAPIProvider.signUpCustomer(
          firstName: firstName,
          lastName: lastName,
          streetAddress: streetAddress,
          city: city,
          district: district,
          province: province,
          birthDate: birthDate,
          gender: gender,
          contactNumber: contactNumber,
        );

        if (result.containsKey("success")) {
          yield state.clone(
            isLoading: false,
          );
        } else {
          yield state.clone(
            isLoading: false,
            error: result["error"],
          );
        }
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
        print(prevIndex);
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
