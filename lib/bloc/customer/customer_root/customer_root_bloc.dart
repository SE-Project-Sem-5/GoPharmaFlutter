import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/user.dart';
import 'package:go_pharma/repos/common/signup/userAPIProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRootBloc extends Bloc<CustomerRootEvent, CustomerRootState> {
  final UserAPIProvider userApiProvider = new UserAPIProvider();
  CustomerRootBloc(BuildContext context)
      : super(CustomerRootState.initialState) {
    _init();
  }

  Future<void> _init() async {
    var prefs = await SharedPreferences.getInstance();
    add(LoadCities());

    final cookie = (prefs.getString('cookie') ?? '');

    // if (cookie != '' && email != '' && password != '') {
    //   print("Looking for access token");
    //   print(cookie);
    //   // Map<String, dynamic> user = await userApiProvider.getCurrentUser(cookie);
    //   add(
    //     LoginUser(
    //       email: email,
    //       password: password,
    //     ),
    //   );
    // } else {
    //   prefs.setString('cookie', "");
    //   add(
    //     ChangeSignInStateEvent(
    //       CustomerRootSignInState.SIGNED_OUT,
    //     ),
    //   );
    // }
  }

  @override
  Stream<CustomerRootState> mapEventToState(CustomerRootEvent event) async* {
    switch (event.runtimeType) {
      case RootErrorEvent:
        final error = (event as RootErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      //  1. Sign up step 1
      case SignUpCustomerEvent:
        yield state.clone(
          isLoading: true,
        );
        final email = (event as SignUpCustomerEvent).email;
        final password = (event as SignUpCustomerEvent).password;
        final role = "customer";
        final user = state.user;
        final Map<String, String> result = await userApiProvider.signUpUser(
          email: email,
          password: password,
          role: role,
        );
        if (result.containsKey("success")) {
          user.email = email;
          user.password = password;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("email", email);
          prefs.setString("password", password);
          yield state.clone(
            isLoading: false,
            signUpProcessState: SignUpProcessState.INITIATED,
            user: user,
          );
        } else {}
        break;

      //  2. Sign up step 2
      case LoginUser:
        yield state.clone(
          isLoading: true,
        );
        final email = (event as LoginUser).email;
        final password = (event as LoginUser).password;
        final Map<String, dynamic> result = await userApiProvider.loginUser(
          email: email,
          password: password,
        );
        if (result.containsKey("data")) {
          final loginReponse = result["data"];
          final cookie = result["cookie"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          print(cookie);
          prefs.setString("cookie", cookie[0]);
          if (loginReponse.data.twoFactorAuth == "none") {
            yield state.clone(
              isLoading: false,
              signUpProcessState: SignUpProcessState.INITIATED,
            );
          } else if (loginReponse.data.twoFactorAuth == "true") {
            yield state.clone(
              isLoading: false,
              signUpProcessState: SignUpProcessState.COMPLETED,
              twoFAenabled: true,
            );
          } else {
            yield state.clone(
              isLoading: false,
              signUpProcessState: SignUpProcessState.COMPLETED,
              twoFAenabled: false,
            );
          }
        } else {}
        break;

      //  3. Sign up step 3
      case SignUpCustomerInformationEvent:
        yield state.clone(
          isLoading: true,
        );
        final firstName = (event as SignUpCustomerInformationEvent).firstName;
        final lastName = (event as SignUpCustomerInformationEvent).lastName;
        final streetAddress =
            (event as SignUpCustomerInformationEvent).streetAddress;
        final city = (event as SignUpCustomerInformationEvent).city;
        final district = (event as SignUpCustomerInformationEvent).district;
        final province = (event as SignUpCustomerInformationEvent).province;
        final birthDate = (event as SignUpCustomerInformationEvent).birthDate;
        final gender = (event as SignUpCustomerInformationEvent).gender;
        final contactNumber =
            (event as SignUpCustomerInformationEvent).contactNumber;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final cookie = prefs.getString('cookie');
        final result = await userApiProvider.signUpCustomer(
          firstName: firstName,
          lastName: lastName,
          streetAddress: streetAddress,
          city: city,
          district: district,
          province: province,
          birthDate: birthDate,
          gender: gender,
          contactNumber: contactNumber,
          cookie: cookie,
        );
        if (result.containsKey("success")) {
          final cookie = result["cookie"];
          prefs.setString("cookie", cookie[0]);
          User newUser = new User(
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            contactNumber: contactNumber,
          );
          yield state.clone(
            isLoading: false,
            signUpProcessState: SignUpProcessState.FILLED,
            user: newUser,
          );
        } else {
          yield state.clone(
            isLoading: false,
            error: result["error"],
          );
        }
        break;
      case GenerateTwoFACode:
        yield state.clone(
          isLoading: true,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
          "cookie",
          "accessToken=s%3AeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOjEyLCJzdGF0ZSI6InZlcmlmaWVkIiwibWVzc2FnZSI6bnVsbCwidGhpcmRQYXJ0eSI6ZmFsc2UsInJvbGUiOiJjdXN0b21lciIsImlhdCI6MTYzNTE0ODgzMiwiZXhwIjo0MjI3MTQ4ODMyfQ.NreQEGlCxFzVZLOFbb81Ckp-qLhQi3_sozjATA4INAQ.xrhoapg0xTYp6f9VzrK%2FP9VYDMzAwAjk%2BREsQwap6Rk; Expires=Wed, 24 Nov 2021 08:00:32 GMT; Path=/; HttpOnly; SameSite=Strict; Domain=localhost",
        );
        final cookie = prefs.getString('cookie');
        final result = await userApiProvider.generateTwoFA(cookie: cookie);
        if (result.containsKey("success")) {
          yield state.clone(
            isLoading: false,
            twoFAenabled: true,
          );
        } else {
          yield state.clone(
            isLoading: false,
            error: result["error"],
          );
        }
        break;
      case VerifyTwoFACode:
        yield state.clone(
          isLoading: true,
        );
        final twoFA = (event as VerifyTwoFACode).twoFA;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final cookie = prefs.getString('cookie');
        final result = await userApiProvider.verifyTwoFA(
          cookie: cookie,
          twoFA: twoFA,
        );
        if (result.containsKey("success")) {
          prefs.setString("cookie", result["cookie"][0]);
          yield state.clone(
            twoFAverified: true,
            isLoading: false,
            twoFA: twoFA,
          );
        } else {
          yield state.clone(
            isLoading: false,
            error: result["error"],
          );
        }
        break;
      case DisableTwoFA:
        yield state.clone(
          isLoading: true,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final cookie = prefs.getString('cookie');
        final result = await userApiProvider.disableTwoFA(
          cookie: cookie,
        );
        if (result.containsKey("success")) {
          yield state.clone(
            isLoading: false,
            twoFAenabled: true,
          );
        } else {
          yield state.clone(
            isLoading: false,
            error: result["error"],
          );
        }
        break;
      case VerifyEmail:
        yield state.clone(
          isLoading: true,
        );
        final result = await userApiProvider.verifyEmail();
        if (result.containsKey("success")) {
          final cookie = result["cookie"];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("cookie", cookie[0]);
          yield state.clone(
            isLoading: false,
            signUpProcessState: SignUpProcessState.VERIFIED,
          );
        } else {
          yield state.clone(
            isLoading: false,
            error: result["error"],
          );
        }
        break;
      case ToggleVisibility:
        yield state.clone(
          isVisible: !state.isVisible,
        );
        break;
      case UpdateCity:
        final city = (event as UpdateCity).city;
        yield state.clone(
          city: city,
        );
        break;
      case UpdateUserEvent:
        final user = (event as UpdateUserEvent).user;
        yield state.clone(
          user: user,
        );
        break;
      case LoadCities:
        yield state.clone(
          isLoading: true,
        );
        final result = await userApiProvider.getAllCities();
        if (result.containsKey("data")) {
          yield state.clone(
            isLoading: false,
            city: result["data"].cities.cities[0],
            cities: result["data"],
          );
        }

        break;
      case LoadCitiesByProvince:
        final province = (event as LoadCitiesByProvince).province;
        yield state.clone(
            // user: user,
            );
        break;
      case UpdateGenderEvent:
        final gender = (event as UpdateGenderEvent).gender;
        yield state.clone(
          gender: gender,
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
