import 'package:flutter/material.dart';
import 'package:go_pharma/repos/common/signup/user.dart';

enum CustomerRootSignInState {
  INITIALIZING,
  SIGNED_IN,
  SIGNED_OUT,
}

@immutable
class CustomerRootState {
  final String error;
  final User user;
  final CustomerRootSignInState signInState;
  final bool initializing;
  final bool isGeneralInformationEditable;
  final bool isPasswordEditable;
  final bool isVisible;

  CustomerRootState({
    this.isPasswordEditable,
    @required this.error,
    @required this.user,
    @required this.signInState,
    @required this.initializing,
    @required this.isVisible,
    @required this.isGeneralInformationEditable,
  });

  static CustomerRootState get initialState => CustomerRootState(
        error: '',
        user: new User(),
        signInState: CustomerRootSignInState.INITIALIZING,
        initializing: false,
        isGeneralInformationEditable: false,
        isPasswordEditable: false,
        isVisible: false,
      );

  CustomerRootState clone({
    String error,
    User user,
    CustomerRootSignInState signInState,
    bool initializing,
    bool isGeneralInformationEditable,
    bool isPasswordEditable,
    bool isVisible,
  }) {
    return CustomerRootState(
      error: error ?? this.error,
      user: user ?? this.user,
      signInState: signInState ?? this.signInState,
      initializing: initializing ?? this.initializing,
      isGeneralInformationEditable:
          isGeneralInformationEditable ?? this.isGeneralInformationEditable,
      isPasswordEditable: isPasswordEditable ?? this.isPasswordEditable,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
