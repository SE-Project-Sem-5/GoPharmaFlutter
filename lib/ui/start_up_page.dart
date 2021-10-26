import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/customer/customer_home_page.dart';

class InitialRoutingPage extends StatelessWidget {
  static const id = "start_up_page";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<CustomerRootBloc, CustomerRootState>(
      listenWhen: (context, state) {
        return state.signInState == CustomerRootSignInState.SIGNED_IN ||
            state.signInState == CustomerRootSignInState.SIGNED_OUT;
      },
      listener: (context, state) {
        if (state.signInState == CustomerRootSignInState.SIGNED_OUT) {
          Navigator.pushReplacementNamed(
            context,
            InitialRoutingPage.id,
          );
        } else if (state.signInState == CustomerRootSignInState.SIGNED_IN) {
          final role = state.user.role;
          if (role == "customer") {
            Navigator.pushReplacementNamed(
              context,
              CustomerHomePage.id,
            );
          }
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
