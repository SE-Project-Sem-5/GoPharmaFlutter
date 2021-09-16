import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_in/sign_in_state.dart';

class DeliveryAgentSignInProvider
    extends BlocProvider<DeliveryAgentSignInBloc> {
  DeliveryAgentSignInProvider({
    @required Key key,
  }) : super(
          key: key,
          create: (context) => DeliveryAgentSignInBloc(context),
          child: TestView(),
        );
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    final scaffold = Scaffold(
      body: BlocBuilder<DeliveryAgentSignInBloc, DeliveryAgentSignInState>(
        buildWhen: (pre, current) => true,
        builder: (context, state) {
          return Center(
            child: Text("Hi...Welcome to BLoC"),
          );
        },
      ),
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<DeliveryAgentSignInBloc, DeliveryAgentSignInState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: scaffold,
    );
  }
}
