import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/dummy/user_customer/customer_model.dart';

enum CustomerRootSignInState {
  INITIALIZING,
  SIGNED_IN,
  SIGNED_OUT,
}

@immutable
class CustomerRootState {
  final String error;
  final Customer customer;
  final CustomerRootSignInState signInState;
  final bool initializing;
  final bool isEditable;

  CustomerRootState({
    @required this.error,
    @required this.customer,
    @required this.signInState,
    @required this.initializing,
    @required this.isEditable,
  });

  static CustomerRootState get initialState => CustomerRootState(
        error: '',
        customer: null,
        signInState: CustomerRootSignInState.INITIALIZING,
        initializing: false,
        isEditable: false,
      );

  CustomerRootState clone({
    String error,
    Customer customer,
    CustomerRootSignInState signInState,
    bool initializing,
    bool isEditable,
  }) {
    return CustomerRootState(
      error: error ?? this.error,
      customer: customer ?? this.customer,
      signInState: signInState ?? this.signInState,
      initializing: initializing ?? this.initializing,
      isEditable: isEditable ?? this.isEditable,
    );
  }
}
