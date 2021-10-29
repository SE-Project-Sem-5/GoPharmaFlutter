import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_state.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
import 'package:go_pharma/repos/common/signup/user.dart';
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
      case UpdateCity:
        final city = (event as UpdateCity).city;
        City newCity;
        for (City c in state.cities.cities) {
          if (c.description == city) {
            newCity = c;
          }
        }
        yield state.clone(
          city: newCity,
        );
        break;
      case UpdateUserEvent:
        final user = (event as UpdateUserEvent).user;
        print("Getting user");
        print(user.firstName);
        final pref = await SharedPreferences.getInstance();
        pref.setString("firstName", user.firstName);
        pref.setString("lastName", user.lastName);
        yield state.clone(
          user: user,
          signInState: DeliveryAgentRootSignInState.SIGNED_IN,
        );
        break;
      case UpdateGenderEvent:
        final gender = (event as UpdateGenderEvent).gender;
        yield state.clone(
          gender: gender,
        );
        break;
      case ChangeSignInStateEvent:
        final signInState = (event as ChangeSignInStateEvent).state;
        yield state.clone(signInState: signInState);
        break;
      case ToggleEditableEvent:
        yield state.clone(
          isGeneralInformationEditable: !state.isGeneralInformationEditable,
        );
        break;
      case ToggleVisibility:
        yield state.clone(
          isVisible: !state.isVisible,
        );
        break;
      case ToggleGeneralInformationEditableEvent:
        yield state.clone(
          isGeneralInformationEditable: !state.isGeneralInformationEditable,
        );
        break;
      case UpdateGenderEvent:
        final gender = (event as UpdateGenderEvent).gender;
        yield state.clone(
          gender: gender,
        );
        break;
      case LogoutEvent:
        yield state.clone(
          isLoading: true,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final result = await userApiProvider.logoutUser();
        prefs.setString("cookie", '');
        yield state.clone(
          signInState: DeliveryAgentRootSignInState.SIGNED_OUT,
          isLoading: false,
          user: new User(),
          initializing: false,
          twoFAenabled: false,
          twoFAverified: false,
          twoFA: '',
          address: '',
          city: new City(),
          cities: new CityList(),
          gender: 'male',
          isGeneralInformationEditable: false,
          isPasswordEditable: false,
          isVisible: false,
        );
        break;
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
          prefs.setString("cookie", cookie);
          Map<String, dynamic> cookieResult =
              await userApiProvider.getCurrentUser(cookie);
          if (loginReponse.data.twoFactorAuth == "true") {
            yield state.clone(
              isLoading: false,
              twoFAenabled: true,
              user: cookieResult["user"],
              signInState: DeliveryAgentRootSignInState.SIGNED_IN,
            );
          } else {
            yield state.clone(
              isLoading: false,
              twoFAenabled: false,
              user: cookieResult["user"],
            );
          }
        } else {}
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
