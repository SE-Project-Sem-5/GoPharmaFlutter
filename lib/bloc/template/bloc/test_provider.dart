import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/template/bloc/test_bloc.dart';

import 'test_bloc.dart';
import 'test_state.dart';

class TestProvider extends BlocProvider<TestBloc> {
  TestProvider({
    required Key key,
  }) : super(
          key: key,
          create: (context) => TestBloc(context),
          child: TestView(),
        );
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final testBloc = BlocProvider.of<TestBloc>(context);

    final scaffold = Scaffold(
      body: BlocBuilder<TestBloc, TestState>(
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
        BlocListener<TestBloc, TestState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: scaffold,
    );
  }
}
