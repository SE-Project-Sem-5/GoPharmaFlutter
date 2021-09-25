import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/customer/sign_up/other_pages/sign_up_2fa.dart';
import 'package:go_pharma/ui/customer/sign_up/other_pages/sign_up_information.dart';
import 'package:go_pharma/ui/customer/sign_up/other_pages/sign_up_start.dart';

//TODO: password needs to be more than 7 characters
// ignore: must_be_immutable
class CustomerSignUpPage extends StatelessWidget {
  static const String id = "customer_sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final customerSignUpBloc = BlocProvider.of<CustomerSignUpBloc>(context);

    return BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
        buildWhen: (previous, current) => previous.step != current.step,
        builder: (context, state) {
          return WillPopScope(
            // ignore: missing_return
            onWillPop: () {
              customerSignUpBloc.add(
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

  Widget pageSwitcher(CustomerSignUpStep step) {
    switch (step) {
      case CustomerSignUpStep.CUSTOMERSIGNUPSTEP_START:
        return SignUpStart();
        break;
      case CustomerSignUpStep.CUSTOMERSIGNUPSTEP_INFORMATION:
        return SignUpInformation();
        break;
      case CustomerSignUpStep.CUSTOMERSIGNUPSTEP_2FA:
        return SignUp2FA();
        break;
    }
  }
}
