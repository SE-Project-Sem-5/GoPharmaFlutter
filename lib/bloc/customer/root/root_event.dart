import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/root/root_state.dart';
import 'package:go_pharma/repos/customer/dummy/user_customer/customer_model.dart';

@immutable
abstract class RootEvent {}

class RootErrorEvent extends RootEvent {
  final String error;

  RootErrorEvent(this.error);
}

class UpdateUserEvent extends RootEvent {
  final Customer customer;

  UpdateUserEvent(this.customer);
}

class ChangeSignInStateEvent extends RootEvent {
  final RootSignInState state;

  ChangeSignInStateEvent(this.state);
}

class RootSignInEvent extends RootEvent {
  final String email;
  final String password;

  RootSignInEvent({this.email, this.password});
}

class ToggleEditableEvent extends RootEvent {
  ToggleEditableEvent();
}

class SignOutEvent extends RootEvent {}

class StartInitCheckEvent extends RootEvent {}
