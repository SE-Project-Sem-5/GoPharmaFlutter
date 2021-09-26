import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:pinput/pin_put/pin_put.dart';

class SignUp2FA extends StatelessWidget {
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
    final bloc = BlocProvider.of<CustomerSignUpBloc>(context);
    String title = "Please enter your 6 digit code";
    return Form(
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
          BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
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
              BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
                builder: (context, state) {
                  return RoundedButtonFilled(
                    title: "Next",
                    size: MediaQuery.of(context).size,
                    fillColor: GoPharmaColors.PrimaryColor,
                    textColor: GoPharmaColors.WhiteColor,
                    onTapped: () {
                      _formKey.currentState.validate();
                      //TODO: backend call - get twoFA value and compare
                      bloc.add(UpdateTwoFA(twoFA: _twoFAController.text));
                      bloc.add(NextStepEvent(
                        currentStep: state.step,
                        context: context,
                      ));
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
