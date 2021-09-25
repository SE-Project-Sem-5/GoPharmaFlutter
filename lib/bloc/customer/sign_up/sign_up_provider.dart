import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/customer/sign_up/customer_sign_up.dart';

class CustomerSignUpProvider extends BlocProvider<CustomerSignUpBloc> {
  static const String id = '/customer_sign_up';

  CustomerSignUpProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CustomerSignUpBloc(context),
          child: SignUpView(),
        );
}

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerSignUpBloc, CustomerSignUpState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: CustomerSignUpPage(),
    );
  }
}
