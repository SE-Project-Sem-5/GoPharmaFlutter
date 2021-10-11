import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';

class OrderSuccessfulPage extends StatelessWidget {
  static final String id = "order_successful";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your order has been placed."),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return Container(
                child: Column(
                  children: [
                    Text(
                      "Your order has been confirmed. Your order ID is ",
                    ),
                    Text(
                      state.orderID.toString(),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
