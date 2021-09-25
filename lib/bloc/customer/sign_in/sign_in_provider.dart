import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/root/root_bloc.dart';
import 'package:go_pharma/bloc/customer/root/root_state.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_state.dart';
import 'package:go_pharma/ui/customer/products/product_home_page.dart';
import 'package:go_pharma/ui/customer/sign_up/customer_sign_up.dart';

class SignInProvider extends BlocProvider<CustomerSignInBloc> {
  static final String id = '/sign_in';
  SignInProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CustomerSignInBloc(context),
          child: SignInView(),
        );
}

class SignInView extends StatelessWidget {
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
        BlocListener<RootBloc, RootState>(
          listenWhen: (previous, current) =>
              previous.signInState != current.signInState,
          listener: (context, state) {
            if (state.signInState == RootSignInState.SIGNED_IN)
              Navigator.pushReplacementNamed(context, ProductHomePage.id);
          },
        ),
      ],
      child: CustomerSignUpPage(),
    );
  }
}
