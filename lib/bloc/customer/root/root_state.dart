import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/user_customer/customer_model.dart';

enum RootSignInState {
  INITIALIZING,
  SIGNED_IN,
  SIGNED_OUT,
}

@immutable
class RootState {
  final String error;
  final Customer customer;
  final RootSignInState signInState;
  final bool initializing;
  final bool isEditable;

  RootState({
    @required this.error,
    @required this.customer,
    @required this.signInState,
    @required this.initializing,
    @required this.isEditable,
  });

  static RootState get initialState => RootState(
        error: '',
        customer: null,
        signInState: RootSignInState.INITIALIZING,
        initializing: false,
        isEditable: false,
      );

  RootState clone({
    String error,
    Customer customer,
    RootSignInState signInState,
    bool initializing,
    bool isEditable,
  }) {
    return RootState(
      error: error ?? this.error,
      customer: customer ?? this.customer,
      signInState: signInState ?? this.signInState,
      initializing: initializing ?? this.initializing,
      isEditable: isEditable ?? this.isEditable,
    );
  }
}
