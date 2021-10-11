import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/pending_delivery/pending_delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/pending_delivery/pending_delivery_state.dart';
import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_deliveries_page.dart';

class PendingDeliveriesProvider extends BlocProvider<PendingOrderBloc> {
  static final String id = "pending_deliveries_page";

  PendingDeliveriesProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => PendingOrderBloc(context),
          child: CategoryView(),
        );
}

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<PendingOrderBloc, PendingOrderState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: PendingDeliveriesPage(),
    );
  }
}
