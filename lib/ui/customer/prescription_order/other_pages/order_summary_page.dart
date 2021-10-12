import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_bloc.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_state.dart';

class OrderSummaryPage extends StatelessWidget {
  static final String id = "summary_page";
  const OrderSummaryPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrescriptionOrderBloc, PrescriptionOrderState>(
      builder: (context, state) {
        return state.orderLoading
            ? Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width / 2) - 10,
                ),
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Your order has been confirmed. Your order ID is #${state.orderID}."
                  " You may view the order progress from the My Orders tab.",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              );
      },
    );
  }
}
