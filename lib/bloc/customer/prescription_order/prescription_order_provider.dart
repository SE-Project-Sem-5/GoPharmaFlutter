import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/ui/customer/prescription_order/prescription_order.dart';

import 'prescription_order_bloc.dart';
import 'prescription_order_state.dart';

class PrescriptionOrderProvider extends BlocProvider<PrescriptionOrderBloc> {
  static final String id = "/prescription_order";
  PrescriptionOrderProvider()
      : super(
          create: (context) => PrescriptionOrderBloc(context),
          child: PrescriptionOrderView(),
        );
}

class PrescriptionOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PrescriptionOrderBloc, PrescriptionOrderState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: PrescriptionOrderPage(),
    );
  }
}
