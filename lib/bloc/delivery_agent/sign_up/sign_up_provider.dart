import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/delivery_agent/sign_up/delivery_agent_sign_up.dart';

class DeliveryAgentSignUpProvider
    extends BlocProvider<DeliveryAgentSignUpBloc> {
  DeliveryAgentSignUpProvider({
      Key key,
  }) : super(
          key: key,
          create: (context) => DeliveryAgentSignUpBloc(context),
          child: DeliveryAgentView(),
        );
}

class DeliveryAgentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<DeliveryAgentSignUpBloc, DeliveryAgentSignUpState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: DeliveryAgentSignUpStart(),
    );
  }
}
