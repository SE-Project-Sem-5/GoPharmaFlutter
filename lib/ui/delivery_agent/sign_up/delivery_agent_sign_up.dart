import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/delivery_agent/sign_up/other_pages/sign_up_2fa.dart';
import 'package:go_pharma/ui/delivery_agent/sign_up/other_pages/sign_up_information.dart';
import 'package:go_pharma/ui/delivery_agent/sign_up/other_pages/sign_up_start.dart';

//TODO: password needs to be more than 7 characters
// ignore: must_be_immutable
class DeliveryAgentSignUpPage extends StatelessWidget {
  static const String id = "customer_sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deliveryAgentSignUpBloc =
        BlocProvider.of<DeliveryAgentSignUpBloc>(context);

    return BlocBuilder<DeliveryAgentSignUpBloc, DeliveryAgentSignUpState>(
        buildWhen: (previous, current) => previous.step != current.step,
        builder: (context, state) {
          return WillPopScope(
            // ignore: missing_return
            onWillPop: () {
              deliveryAgentSignUpBloc.add(
                PreviousStepEvent(
                  currentStep: state.step,
                  context: context,
                ),
              );
            },
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: Text("SIGN UP"),
                ),
                body: Container(
                  child: pageSwitcher(state.step),
                ),
              ),
            ),
          );
        });
  }

  Widget pageSwitcher(DeliveryAgentSignUpStep step) {
    switch (step) {
      case DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_START:
        return SignUpStart();
        break;
      case DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_INFORMATION:
        return SignUpInformation();
        break;
      case DeliveryAgentSignUpStep.DELIVERYAGENTSIGNUPSTEP_2FA:
        return SignUp2FA();
        break;
    }
  }
}
