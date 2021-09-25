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
  final bool isEditable;

  DeliveryAgentRootState({
    @required this.error,
    @required this.deliveryAgent,
    @required this.signInState,
    @required this.initializing,
    @required this.isEditable,
  });

  static DeliveryAgentRootState get initialState => DeliveryAgentRootState(
        error: '',
        deliveryAgent: null,
        signInState: DeliveryAgentRootSignInState.INITIALIZING,
        initializing: false,
        isEditable: false,
      );

  DeliveryAgentRootState clone({
    String error,
    DeliveryAgent deliveryAgent,
    DeliveryAgentRootSignInState signInState,
    bool initializing,
    bool isEditable,
  }) {
    return DeliveryAgentRootState(
      error: error ?? this.error,
      deliveryAgent: deliveryAgent ?? this.deliveryAgent,
      signInState: signInState ?? this.signInState,
      initializing: initializing ?? this.initializing,
      isEditable: isEditable ?? this.isEditable,
    );
  }
}
