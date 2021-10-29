import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/user.dart';

@immutable
abstract class CustomerRootEvent {}

class RootErrorEvent extends CustomerRootEvent {
  final String error;

  RootErrorEvent(this.error);
}

class LogoutEvent extends CustomerRootEvent {
  LogoutEvent();
}

//Sign up process
//1.
class SignUpCustomerEvent extends CustomerRootEvent {
  final String email;
  final String password;

  SignUpCustomerEvent({this.email, this.password});
}

//2.
class SignUpCustomerInformationEvent extends CustomerRootEvent {
  final String firstName;
  final String lastName;
  final String streetAddress;
  final String birthDate;
  final String gender;
  final String contactNumber;

  SignUpCustomerInformationEvent({
    this.firstName,
    this.lastName,
    this.streetAddress,
    this.birthDate,
    this.gender,
    this.contactNumber,
  });
}

//3.
class LoginUser extends CustomerRootEvent {
  final String email;
  final String password;
  LoginUser({
    this.email,
    this.password,
  });
}

//4. Option 1 - Part 1
class GenerateTwoFACode extends CustomerRootEvent {
  GenerateTwoFACode();
}

//4. Option 1 - Part 2
class VerifyTwoFACode extends CustomerRootEvent {
  final String twoFA;
  VerifyTwoFACode({this.twoFA});
}

//4. Option 2
class DisableTwoFA extends CustomerRootEvent {
  DisableTwoFA();
}

class VerifyEmail extends CustomerRootEvent {
  final String code;
  VerifyEmail({this.code});
}

class ToggleGeneralInformationEditableEvent extends CustomerRootEvent {
  ToggleGeneralInformationEditableEvent();
}

class ChangeSignInStateEvent extends CustomerRootEvent {
  final CustomerRootSignInState state;

  ChangeSignInStateEvent(this.state);
}

class UpdateUserEvent extends CustomerRootEvent {
  final User user;
  UpdateUserEvent(this.user);
}

//UI events
class ToggleVisibility extends CustomerRootEvent {
  ToggleVisibility();
}

class UpdateGenderEvent extends CustomerRootEvent {
  final String gender;
  UpdateGenderEvent({this.gender});
}

class LoadCities extends CustomerRootEvent {
  LoadCities();
}

class LoadCitiesByProvince extends CustomerRootEvent {
  final String province;
  LoadCitiesByProvince({this.province});
}

class UpdateCity extends CustomerRootEvent {
  final String city;
  UpdateCity({this.city});
}
