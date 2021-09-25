import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/repos/customer/dummy/user_customer/customer_model.dart';

@immutable
abstract class CustomerRootEvent {}

class RootErrorEvent extends CustomerRootEvent {
  final String error;

  RootErrorEvent(this.error);
}

class UpdateUserEvent extends CustomerRootEvent {
  final Customer customer;

  UpdateUserEvent(this.customer);
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

class ToggleEditableEvent extends CustomerRootEvent {
  ToggleEditableEvent();
}

class SignOutEvent extends CustomerRootEvent {}

class StartInitCheckEvent extends CustomerRootEvent {}
