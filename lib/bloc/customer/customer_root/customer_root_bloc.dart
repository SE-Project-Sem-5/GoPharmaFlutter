import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
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
          CustomerRootSignInState.SIGNED_OUT,
        ),
      );
    }
  }

  @override
  Stream<CustomerRootState> mapEventToState(CustomerRootEvent event) async* {
    switch (event.runtimeType) {
      case RootErrorEvent:
        final error = (event as RootErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ChangeSignInStateEvent:
        final stateSignIn = (event as ChangeSignInStateEvent).state;
        yield state.clone(
          signInState: stateSignIn,
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
          signInState: CustomerRootSignInState.SIGNED_OUT,
          isLoading: false,
          user: new User(),
          signUpProcessState: SignUpProcessState.NONE,
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
          prefs.setString("cookie", cookie);
          if (loginReponse.data.twoFactorAuth == "none") {
            yield state.clone(
              isLoading: false,
              signUpProcessState: SignUpProcessState.INITIATED,
            );
          } else {
            Map<String, dynamic> result =
                await userApiProvider.getCurrentUser(cookie);
            if (loginReponse.data.twoFactorAuth == "true") {
              yield state.clone(
                isLoading: false,
                signUpProcessState: SignUpProcessState.COMPLETED,
                twoFAenabled: true,
                user: result["user"],
              );
            } else {
              yield state.clone(
                isLoading: false,
                signUpProcessState: SignUpProcessState.COMPLETED,
                twoFAenabled: false,
                user: result["user"],
              );
            }
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
        final birthDate = (event as SignUpCustomerInformationEvent).birthDate;
        final gender = (event as SignUpCustomerInformationEvent).gender;
        final contactNumber =
            (event as SignUpCustomerInformationEvent).contactNumber;
        final cityInState = state.city;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final cookie = prefs.getString('cookie');
        final result = await userApiProvider.signUpCustomer(
          firstName: firstName,
          lastName: lastName,
          streetAddress: streetAddress,
          city: cityInState.city,
          district: cityInState.district,
          province: cityInState.province,
          birthDate: birthDate,
          gender: gender,
          contactNumber: contactNumber,
          cookie: cookie,
        );
        if (result.containsKey("success")) {
          final cookie = result["cookie"];
          prefs.setString("cookie", cookie);
          User newUser = new User(
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            contactNumber: contactNumber,
            addressDetail: new AddressDetail(
              streetAddress: streetAddress,
              provinceDistrictCity: new ProvinceDistrictCity(
                city: cityInState.city,
                district: cityInState.district,
                province: cityInState.province,
              ),
            ),
          );
          final twoFA = await userApiProvider.generateTwoFA(
            cookie: cookie,
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
      case VerifyEmail:
        yield state.clone(
          isLoading: true,
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String cookie = prefs.get('cookie');
        final code = (event as VerifyEmail).code;
        final result = await userApiProvider.verifyEmail(
          code: code,
          cookie: cookie,
        );
        if (result.containsKey("data")) {
          print("email successfully verified");
          final cookie = result["cookie"];
          prefs.setString("cookie", cookie);
          yield state.clone(
            isLoading: false,
            signUpProcessState: SignUpProcessState.VERIFIED,
          );
        } else {
          print("error");
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
        final cookie = prefs.getString('cookie');
        final result = await userApiProvider.generateTwoFA(cookie: cookie);
        if (result.containsKey("data")) {
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
        if (result.containsKey("data")) {
          prefs.setString("cookie", result["cookie"]);
          yield state.clone(
            twoFAverified: true,
            signUpProcessState: SignUpProcessState.COMPLETED,
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
        if (result.containsKey("data")) {
          yield state.clone(
            isLoading: false,
            twoFAenabled: false,
            signUpProcessState: SignUpProcessState.COMPLETED,
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
        //TODO: implement
        final pref = await SharedPreferences.getInstance();
        pref.setString("firstName", user.firstName);
        pref.setString("lastName", user.firstName);
        pref.setString("firstName", user.firstName);
        pref.setString("firstName", user.firstName);
        pref.setString("firstName", user.firstName);
        pref.setString("firstName", user.firstName);
        pref.setString("firstName", user.firstName);
        yield state.clone(
          user: user,
          signInState: CustomerRootSignInState.SIGNED_IN,
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
            city: result["data"].cities[0],
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
      case ToggleGeneralInformationEditableEvent:
        final isEditable = state.isGeneralInformationEditable;
        yield state.clone(
          isGeneralInformationEditable: !isEditable,
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
