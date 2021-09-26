import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/user_delivery_agent/delivery_agent_model.dart';

enum DeliveryAgentRootSignInState {
  INITIALIZING,
  SIGNED_IN,
  SIGNED_OUT,
}

@immutable
class DeliveryAgentRootState {
  final String error;
  final DeliveryAgent deliveryAgent;
  final DeliveryAgentRootSignInState signInState;
  final bool initializing;
  final bool isGeneralInformationEditable;
  final bool isPasswordEditable;
  final bool isVisible;

  DeliveryAgentRootState({
    @required this.error,
    this.isPasswordEditable,
    @required this.isVisible,
    @required this.deliveryAgent,
    @required this.signInState,
    @required this.initializing,
    @required this.isGeneralInformationEditable,
  });

  static DeliveryAgentRootState get initialState => DeliveryAgentRootState(
        error: '',
        deliveryAgent: null,
        signInState: DeliveryAgentRootSignInState.INITIALIZING,
        initializing: false,
        isGeneralInformationEditable: false,
        isPasswordEditable: false,
        isVisible: false,
      );

  DeliveryAgentRootState clone({
    String error,
    DeliveryAgent deliveryAgent,
    DeliveryAgentRootSignInState signInState,
    bool initializing,
    bool isGeneralInformationEditable,
    bool isPasswordEditable,
    bool isVisible,
  }) {
    return DeliveryAgentRootState(
      error: error ?? this.error,
      deliveryAgent: deliveryAgent ?? this.deliveryAgent,
      signInState: signInState ?? this.signInState,
      initializing: initializing ?? this.initializing,
      isGeneralInformationEditable:
          isGeneralInformationEditable ?? this.isGeneralInformationEditable,
      isPasswordEditable: isPasswordEditable ?? this.isPasswordEditable,
      isVisible: isVisible ?? this.isVisible,
    );
  }
}
