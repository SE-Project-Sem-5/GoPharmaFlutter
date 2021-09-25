import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_state.dart';

@immutable
abstract class DeliveryAgentSignInEvent {}

class ErrorEvent extends DeliveryAgentSignInEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends DeliveryAgentSignInEvent {
  final bool isVisible;
  ToggleVisibility(this.isVisible);
}

class NextStepEvent extends DeliveryAgentSignInEvent {
  final DeliveryAgentSignInStep currentStep;
  final BuildContext context;

  NextStepEvent({this.currentStep, this.context});
}

class PreviousStepEvent extends DeliveryAgentSignInEvent {
  final DeliveryAgentSignInStep currentStep;
  final BuildContext context;
  PreviousStepEvent({this.currentStep, this.context});
}

class UpdateTwoFA extends DeliveryAgentSignInEvent {
  final String twoFA;
  UpdateTwoFA({this.twoFA});
}
