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
  final bool isGeneralInformationEditable;
  final bool isPasswordEditable;
  final bool isVisible;

  CustomerRootState({
    this.isPasswordEditable,
    @required this.error,
    @required this.customer,
    @required this.signInState,
    @required this.initializing,
    @required this.isVisible,
    @required this.isGeneralInformationEditable,
  });

  static CustomerRootState get initialState => CustomerRootState(
        error: '',
        customer: null,
        signInState: CustomerRootSignInState.INITIALIZING,
        initializing: false,
        isGeneralInformationEditable: false,
        isPasswordEditable: false,
        isVisible: false,
      );

  CustomerRootState clone({
    String error,
    Customer customer,
    CustomerRootSignInState signInState,
    bool initializing,
    bool isGeneralInformationEditable,
    bool isPasswordEditable,
    bool isVisible,
  }) {
    return CustomerRootState(
      error: error ?? this.error,
      customer: customer ?? this.customer,
      signInState: signInState ?? this.signInState,
      initializing: initializing ?? this.initializing,
      isGeneralInformationEditable:
          isGeneralInformationEditable ?? this.isGeneralInformationEditable,
      isPasswordEditable: isPasswordEditable ?? this.isPasswordEditable,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
