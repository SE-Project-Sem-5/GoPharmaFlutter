import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';

class CustomerSignUpProvider extends BlocProvider<CustomerSignUpBloc> {
  CustomerSignUpProvider({
    required Key key,
  }) : super(
          key: key,
          create: (context) => CustomerSignUpBloc(context),
          child: TestView(),
        );
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    final scaffold = Scaffold(
      body: BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
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
        BlocListener<CustomerSignUpBloc, CustomerSignUpState>(
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
