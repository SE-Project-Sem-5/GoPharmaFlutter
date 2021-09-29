import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/pending_delivery/pending_delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/pending_delivery/pending_delivery_state.dart';

class PendingOrderProvider extends BlocProvider<PendingOrderBloc> {
  static final String id = "product_categories_page";

  PendingOrderProvider({
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
      // child: ProductCategoriesPage(),
    );
  }
}
