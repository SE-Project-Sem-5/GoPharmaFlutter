import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_state.dart';

@immutable
abstract class DeliveryAgentSignUpEvent {}

class ErrorEvent extends DeliveryAgentSignUpEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleVisibility extends DeliveryAgentSignUpEvent {
  ToggleVisibility();
}

class NextStepEvent extends DeliveryAgentSignUpEvent {
  final DeliveryAgentSignUpStep currentStep;
  final BuildContext context;

  NextStepEvent({this.context, this.currentStep});
}

class PreviousStepEvent extends DeliveryAgentSignUpEvent {
  final DeliveryAgentSignUpStep currentStep;
  final BuildContext context;
  PreviousStepEvent({this.currentStep, this.context});
}

class UpdateTwoFA extends DeliveryAgentSignUpEvent {
  final String twoFA;
  UpdateTwoFA({this.twoFA});
}
