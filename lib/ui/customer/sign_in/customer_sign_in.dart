import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_event.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_state.dart';
import 'package:go_pharma/ui/customer/sign_in/other_pages/customer_sign_in.dart';
import 'package:go_pharma/ui/customer/sign_in/other_pages/customer_sign_in_2fa.dart';

// ignore: must_be_immutable
class CustomerSignInPage extends StatelessWidget {
  static const String id = "customer_sign_in";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final customerSignInBloc = BlocProvider.of<CustomerSignInBloc>(context);

    return BlocBuilder<CustomerSignInBloc, CustomerSignInState>(
        buildWhen: (previous, current) => previous.step != current.step,
        builder: (context, state) {
          return WillPopScope(
            // ignore: missing_return
            onWillPop: () {
              customerSignInBloc.add(
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
        });
  }

  Widget pageSwitcher(CustomerSignInStep step) {
    switch (step) {
      case CustomerSignInStep.CUSTOMERSIGNINSTEP_START:
        return CustomerSignInStart();
        break;
      case CustomerSignInStep.CUSTOMERSIGNINSTEP_2FA:
        return CustomerSignIn2FA();
        break;
    }
  }
}
