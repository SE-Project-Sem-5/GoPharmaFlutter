import 'package:flutter/material.dart';
import 'package:go_pharma/repos/common/signup/cityList.dart';
import 'package:go_pharma/repos/common/signup/user.dart';

enum DeliveryAgentRootSignInState {
  INITIALIZING,
  SIGNED_IN,
  SIGNED_OUT,
}

@immutable
class DeliveryAgentRootState {
  final String error;
  final User user;
  final DeliveryAgentRootSignInState signInState;
  final bool initializing;
  final bool isGeneralInformationEditable;
  final bool isPasswordEditable;
  final bool isVisible;
  final bool isLoading;
  final bool twoFAenabled;
  final String twoFA;
  final CityList cities;
  final City city;
  final String address;
  final String gender;

  DeliveryAgentRootState({
    @required this.error,
    this.isPasswordEditable,
    @required this.isVisible,
    @required this.isLoading,
    @required this.user,
    @required this.twoFAenabled,
    @required this.twoFA,
    @required this.isGeneralInformationEditable,
    @required this.cities,
    @required this.city,
    @required this.address,
    @required this.gender,
    @required this.signInState,
    @required this.initializing,
  });

  static DeliveryAgentRootState get initialState => DeliveryAgentRootState(
        error: '',
        user: new User(),
        isLoading: false,
        signInState: DeliveryAgentRootSignInState.INITIALIZING,
        initializing: false,
        isGeneralInformationEditable: false,
        isPasswordEditable: false,
        isVisible: false,
        twoFAenabled: false,
        twoFA: '',
        address: '',
        city: new City(),
        cities: new CityList(),
        gender: 'male',
      );

  DeliveryAgentRootState clone({
    String error,
    User user,
    DeliveryAgentRootSignInState signInState,
    bool initializing,
    bool isLoading,
    bool twoFAenabled,
    bool isGeneralInformationEditable,
    bool isPasswordEditable,
    bool isVisible,
    String gender,
    String address,
    City city,
    CityList cities,
    bool twoFAverified,
    String twoFA,
  }) {
    return DeliveryAgentRootState(
      error: error ?? this.error,
      twoFAenabled: twoFAenabled ?? this.twoFAenabled,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      signInState: signInState ?? this.signInState,
      initializing: initializing ?? this.initializing,
      isGeneralInformationEditable:
          isGeneralInformationEditable ?? this.isGeneralInformationEditable,
      isPasswordEditable: isPasswordEditable ?? this.isPasswordEditable,
      isVisible: isVisible ?? this.isVisible,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      cities: cities ?? this.cities,
      address: address ?? this.address,
      twoFA: twoFA ?? this.twoFA,
    );
  }
}
