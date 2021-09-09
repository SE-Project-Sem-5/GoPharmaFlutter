import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_state.dart';

class CustomerSignInProvider extends BlocProvider<CustomerSignInBloc> {
  CustomerSignInProvider({
    required Key key,
  }) : super(
          key: key,
          create: (context) => CustomerSignInBloc(context),
          child: TestView(),
        );
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    final scaffold = Scaffold(
      body: BlocBuilder<CustomerSignInBloc, CustomerSignInState>(
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
        BlocListener<CustomerSignInBloc, CustomerSignInState>(
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
