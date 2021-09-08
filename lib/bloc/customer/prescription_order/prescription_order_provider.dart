import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'prescription_order_bloc.dart';
import 'prescription_order_state.dart';

class PrescriptionOrderProvider extends BlocProvider<PrescriptionOrderBloc> {
  PrescriptionOrderProvider({
    required Key key,
  }) : super(
          key: key,
          create: (context) => PrescriptionOrderBloc(context),
          child: TestView(),
        );
}

class TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final scaffold = Scaffold(
      body: BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
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
        BlocListener<PrescriptionOrderBloc, PrescriptionOrderState>(
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
