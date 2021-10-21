import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/common/signup/user.dart';

@immutable
abstract class CustomerRootEvent {}

class RootErrorEvent extends CustomerRootEvent {
  final String error;

  RootErrorEvent(this.error);
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

class StartInitCheckEvent extends CustomerRootEvent {}

class ToggleGeneralInformationEditableEvent extends CustomerRootEvent {
  ToggleGeneralInformationEditableEvent();
}

class ToggleVisibility extends CustomerRootEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}
