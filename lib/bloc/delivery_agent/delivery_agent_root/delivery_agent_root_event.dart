import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_state.dart';
import 'package:go_pharma/repos/delivery_agent/user_delivery_agent/delivery_agent_model.dart';

@immutable
abstract class DeliveryAgentRootEvent {}

class RootErrorEvent extends DeliveryAgentRootEvent {
  final String error;

  RootErrorEvent(this.error);
}

class UpdateUserEvent extends DeliveryAgentRootEvent {
  final DeliveryAgent deliveryAgent;

  UpdateUserEvent(this.deliveryAgent);
}

class ChangeSignInStateEvent extends DeliveryAgentRootEvent {
  final DeliveryAgentRootSignInState state;

  ChangeSignInStateEvent(this.state);
}

class RootSignInEvent extends DeliveryAgentRootEvent {
  final String email;
  final String password;

  RootSignInEvent({this.email, this.password});
}

class ToggleEditableEvent extends DeliveryAgentRootEvent {
  ToggleEditableEvent();
}

class SignOutEvent extends DeliveryAgentRootEvent {}

class StartInitCheckEvent extends DeliveryAgentRootEvent {}

class ToggleGeneralInformationEditableEvent extends DeliveryAgentRootEvent {
  ToggleGeneralInformationEditableEvent();
}

class ToggleVisibility extends DeliveryAgentRootEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}
