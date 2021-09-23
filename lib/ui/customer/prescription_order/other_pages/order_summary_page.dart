import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';

class OrderSummaryPage extends StatelessWidget {
  static final String id = "summary_page";
  const OrderSummaryPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final prescriptionOrderBloc =
        BlocProvider.of<PrescriptionOrderBloc>(context);

    return BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.orderLoading
                ? CircularProgressIndicator()
                : Text("Order loaded"),
          ],
        );
      },
    );
  }
}
