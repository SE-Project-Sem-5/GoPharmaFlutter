import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_state.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/delivery_agent_sign_in.dart';

class DeliveryAgentSignInProvider
    extends BlocProvider<DeliveryAgentSignInBloc> {
  static final String id = "/delivery_agent_sign_in";
  DeliveryAgentSignInProvider()
      : super(
          create: (context) => DeliveryAgentSignInBloc(context),
          child: DeliveryAgentSignInView(),
        );
}

class DeliveryAgentSignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<DeliveryAgentSignInBloc, DeliveryAgentSignInState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: DeliveryAgentSignInPage(),
    );
  }
}
