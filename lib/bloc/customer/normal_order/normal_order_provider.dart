import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/normal_order/normal_order_bloc.dart';
import 'package:go_pharma/bloc/customer/normal_order/normal_order_state.dart';

class NormalOrderProvider extends BlocProvider<NormalOrderBloc> {
  NormalOrderProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => NormalOrderBloc(context),
          child: NormalOrderView(),
        );
}

class NormalOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    final scaffold = Scaffold(
      body: BlocBuilder<NormalOrderBloc, NormalOrderState>(
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
        BlocListener<NormalOrderBloc, NormalOrderState>(
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
