import 'package:flutter/material.dart';
import 'package:go_pharma/repos/common/signup/user.dart';

enum CustomerRootSignInState {
  INITIALIZING,
  SIGNED_IN,
  SIGNED_OUT,
}

enum SignUpProcessState {
  NONE,
  INITIATED,
  FILLED,
  VERIFIED,
  COMPLETED,
  DISABLED,
}

@immutable
class CustomerRootState {
  final String error;
  final User user;
  final CustomerRootSignInState signInState;
  final SignUpProcessState signUpProcessState;
  final bool initializing;
  final bool isLoading;
  final bool isGeneralInformationEditable;
  final bool isPasswordEditable;
  final bool isVisible;
  final bool twoFAenabled;
  final String twoFA;
  final String gender;

  CustomerRootState({
    this.isPasswordEditable,
    @required this.error,
    @required this.user,
    @required this.twoFAenabled,
    @required this.gender,
    @required this.isLoading,
    @required this.twoFA,
    @required this.signUpProcessState,
    @required this.signInState,
    @required this.initializing,
    @required this.isVisible,
    @required this.isGeneralInformationEditable,
  });

  static CustomerRootState get initialState => CustomerRootState(
        error: '',
        user: new User(),
        signUpProcessState: SignUpProcessState.NONE,
        signInState: CustomerRootSignInState.INITIALIZING,
        initializing: false,
        twoFAenabled: false,
        twoFA: '',
        gender: 'male',
        isGeneralInformationEditable: false,
        isPasswordEditable: false,
        isVisible: false,
        isLoading: false,
      );

  CustomerRootState clone({
    String error,
    String gender,
    User user,
    CustomerRootSignInState signInState,
    bool initializing,
    bool isLoading,
    bool twoFAenabled,
    SignUpProcessState signUpProcessState,
    bool isGeneralInformationEditable,
    bool isPasswordEditable,
    bool isVisible,
    String twoFA,
  }) {
    return CustomerRootState(
      error: error ?? this.error,
      gender: gender ?? this.gender,
      twoFAenabled: twoFAenabled ?? this.twoFAenabled,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      signUpProcessState: signUpProcessState ?? this.signUpProcessState,
      signInState: signInState ?? this.signInState,
      twoFA: twoFA ?? this.twoFA,
      initializing: initializing ?? this.initializing,
      isGeneralInformationEditable:
          isGeneralInformationEditable ?? this.isGeneralInformationEditable,
      isPasswordEditable: isPasswordEditable ?? this.isPasswordEditable,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
