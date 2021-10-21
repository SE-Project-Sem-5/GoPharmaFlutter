import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/user.dart';

@immutable
abstract class CustomerRootEvent {}

class RootErrorEvent extends CustomerRootEvent {
  final String error;

  RootErrorEvent(this.error);
}

//Sign up process
//1.
class SignUpCustomerEvent extends CustomerRootEvent {
  final String email;
  final String password;

  SignUpCustomerEvent({this.email, this.password});
}

class UpdateUserEvent extends CustomerRootEvent {
  final User user;
  UpdateUserEvent(this.user);
}

class ChangeSignInStateEvent extends CustomerRootEvent {
  final CustomerRootSignInState state;

  ChangeSignInStateEvent(this.state);
}

class RootSignInEvent extends CustomerRootEvent {
  final String email;
  final String password;

  RootSignInEvent({this.email, this.password});
}

class SignOutEvent extends CustomerRootEvent {}

class ToggleGeneralInformationEditableEvent extends CustomerRootEvent {
  ToggleGeneralInformationEditableEvent();
}

class ToggleVisibility extends CustomerRootEvent {
  ToggleVisibility();
}

class UpdateTwoFA extends CustomerRootEvent {
  final String twoFA;
  UpdateTwoFA({this.twoFA});
}
