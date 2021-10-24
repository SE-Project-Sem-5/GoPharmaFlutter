import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/customer_home_page.dart';
import 'package:pinput/pin_put/pin_put.dart';

class CustomerSignIn2FA extends StatelessWidget {
  static final String id = "customer_2fa";
  final _formKey = GlobalKey<FormState>();
  final _twoFAController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: GoPharmaColors.PrimaryColor),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CustomerRootBloc>(context);
    String title = "Please enter your 6 digit code";
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: GoPharmaColors.PrimaryColor,
              ),
            ),
            Spacer(),
            BlocBuilder<CustomerRootBloc, CustomerRootState>(
              builder: (context, state) {
                _twoFAController.text = state.twoFA;
                return Container(
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(20.0),
                  child: PinPut(
                    // ignore: missing_return
                    validator: (value) {
                      if (value == null || value == '') {
                        return "Invalid code. Please try again.";
                      }
                    },
                    fieldsCount: 6,
                    onSubmit: (String pin) {
                      print(pin);
                    },
                    focusNode: _pinPutFocusNode,
                    controller: _twoFAController,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: GoPharmaColors.PrimaryColor.withOpacity(.5),
                      ),
                    ),
                  ),
                );
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlocBuilder<CustomerRootBloc, CustomerRootState>(
                  builder: (context, state) {
                    return RoundedButtonFilled(
                      title: "Sign In",
                      size: MediaQuery.of(context).size,
                      fillColor: GoPharmaColors.PrimaryColor,
                      textColor: GoPharmaColors.WhiteColor,
                      onTapped: () {
                        if (_formKey.currentState.validate()) {
                          bloc.add(
                            VerifyTwoFACode(
                              twoFA: _twoFAController.text,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
