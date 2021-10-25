import 'package:flutter/material.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
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
  final bool twoFAverified;
  final String twoFA;
  final CityList cities;
  final String city;
  final String address;
  final String gender;

  CustomerRootState({
    this.isPasswordEditable,
    @required this.error,
    @required this.cities,
    @required this.city,
    @required this.user,
    @required this.twoFAenabled,
    @required this.address,
    @required this.twoFAverified,
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
        twoFAverified: false,
        twoFA: '',
        city: '',
        address: '',
        cities: new CityList(),
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
    CityList cities,
    CustomerRootSignInState signInState,
    bool initializing,
    bool isLoading,
    bool twoFAenabled,
    bool twoFAverified,
    SignUpProcessState signUpProcessState,
    bool isGeneralInformationEditable,
    bool isPasswordEditable,
    bool isVisible,
    String twoFA,
    String address,
    String city,
  }) {
    return CustomerRootState(
      error: error ?? this.error,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      cities: cities ?? this.cities,
      address: address ?? this.address,
      twoFAenabled: twoFAenabled ?? this.twoFAenabled,
      twoFAverified: twoFAverified ?? this.twoFAverified,
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
