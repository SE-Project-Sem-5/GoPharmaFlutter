import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_event.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_state.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/other_pages/delivery_agent_sign_in.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/other_pages/two_fa.dart';

//TODO: password needs to be more than 7 characters
// ignore: must_be_immutable
class DeliveryAgentSignInPage extends StatelessWidget {
  static const String id = "customer_sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deliveryAgentSignInBloc =
        BlocProvider.of<DeliveryAgentSignInBloc>(context);

    return BlocBuilder<DeliveryAgentSignInBloc, DeliveryAgentSignInState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return WillPopScope(
          // ignore: missing_return
          onWillPop: () {
            deliveryAgentSignInBloc.add(
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
                title: Text("SIGN IN"),
              ),
              body: Container(
                child: pageSwitcher(state.step),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget pageSwitcher(DeliveryAgentSignInStep step) {
    switch (step) {
      case DeliveryAgentSignInStep.DELIVERYAGENTSIGNINSTEP_START:
        return DeliveryAgentSignInStart();
        break;
      case DeliveryAgentSignInStep.DELIVERYAGENTSIGNINSTEP_2FA:
        return SignIn2FA();
        break;
    }
  }
}
