import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_state.dart';
import 'package:go_pharma/ui/customer/products/product_home_page.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in.dart';

class CustomerSignInProvider extends BlocProvider<CustomerSignInBloc> {
  static final String id = '/customer_sign_in';
  CustomerSignInProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CustomerSignInBloc(context),
          child: CustomerSignInView(),
        );
}

class CustomerSignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerSignInBloc, CustomerSignInState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
        BlocListener<CustomerRootBloc, CustomerRootState>(
          listenWhen: (previous, current) =>
              previous.signInState != current.signInState,
          listener: (context, state) {
            if (state.signInState == CustomerRootSignInState.SIGNED_IN)
              Navigator.pushReplacementNamed(context, ProductHomePage.id);
          },
        ),
      ],
      child: CustomerSignInPage(),
    );
  }
}
