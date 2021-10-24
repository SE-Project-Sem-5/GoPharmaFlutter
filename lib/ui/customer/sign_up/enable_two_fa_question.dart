import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/customer_home_page.dart';
import 'package:intl/intl.dart';

class EnableTwoFAQuestion extends StatelessWidget {
  static final String id = "enable_two_fa_question";
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CustomerRootBloc>(context);

    return BlocListener<CustomerRootBloc, CustomerRootState>(
      listenWhen: (context, state) {
        return state.signUpProcessState == SignUpProcessState.COMPLETED;
      },
      listener: (context, state) {
        Navigator.pushReplacementNamed(
          context,
          CustomerHomePage.id,
        );
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
              "Would you like to turn on Two-Factor Authentication?",
            ),
          ),
          body: BlocBuilder<CustomerRootBloc, CustomerRootState>(
            buildWhen: (p, c) => p.isLoading != c.isLoading,
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator()
                  : Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        left: 25.0,
                        right: 25.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundedButtonFilled(
                            title: "Yes",
                            size: MediaQuery.of(context).size,
                            fillColor: GoPharmaColors.PrimaryColor,
                            textColor: GoPharmaColors.WhiteColor,
                            onTapped: () {
                              bloc.add(
                                DisableTwoFA(),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundedButtonFilled(
                            title: "No",
                            size: MediaQuery.of(context).size,
                            fillColor: GoPharmaColors.PrimaryColor,
                            textColor: GoPharmaColors.WhiteColor,
                            onTapped: () {
                              bloc.add(
                                DisableTwoFA(),
                              );
                            },
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
