import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';

class OrderListProvider extends BlocProvider<OrderListBloc> {
  OrderListProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => OrderListBloc(context),
          child: NormalOrderView(),
        );
}

class NormalOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    final scaffold = Scaffold(
      body: BlocBuilder<OrderListBloc, OrderListState>(
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
        BlocListener<OrderListBloc, OrderListState>(
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
