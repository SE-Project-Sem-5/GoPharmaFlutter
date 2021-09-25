import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';

class CheckoutProvider extends BlocProvider<CheckoutBloc> {
  static final String id = "/checkout_page";
  CheckoutProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CheckoutBloc(context),
          child: CheckoutView(),
        );
}

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<CheckoutBloc, CheckoutState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: CustomerHomePage(),
    );
  }
}
