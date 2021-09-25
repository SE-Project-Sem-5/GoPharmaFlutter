import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/delivery_agent/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/other_pages/delivery_agent_sign_in.dart';

class SignUpStart extends StatelessWidget {
  static const String id = "customer_sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController reenteredPasswordController =
      new TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String title = "Enter your email and password";
    final bloc = BlocProvider.of<DeliveryAgentSignUpBloc>(context);

    return Form(
      key: _form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            title,
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: GoPharmaColors.PrimaryColor),
          ),
          SizedBox(
            height: 30,
          ),
          TextFieldContainer(
            child: TextFormField(
              validator: (val) {
                final bool isValid =
                    EmailValidator.validate(emailController.text);
                if (!isValid) return "Invalid email";
                if (val.isEmpty) return 'Empty';
                return null;
              },
              controller: emailController,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
              onChanged: (String value) {},
              cursorColor: GoPharmaColors.PrimaryColor,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: GoPharmaColors.PrimaryColor,
                ),
                hintText: "Your Email",
                hintStyle: TextStyle(
                  color: GoPharmaColors.hintTextColor,
                  fontSize: 18.0,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          BlocBuilder<DeliveryAgentSignUpBloc, DeliveryAgentSignUpState>(
            buildWhen: (previous, current) =>
                previous.isVisible != current.isVisible,
            builder: (context, state) {
              return TextFieldContainer(
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please type in your password.");
                    }
                  },
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  obscureText: state.isVisible,
                  onChanged: (String value) {},
                  cursorColor: GoPharmaColors.PrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: GoPharmaColors.PrimaryColor,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: GoPharmaColors.hintTextColor,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      child: Icon(
                        state.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: GoPharmaColors.PrimaryColor,
                      ),
                      onTap: () {
                        bloc.add(ToggleVisibility());
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          BlocBuilder<DeliveryAgentSignUpBloc, DeliveryAgentSignUpState>(
            buildWhen: (previous, current) =>
                previous.isVisible != current.isVisible,
            builder: (context, state) {
              return TextFieldContainer(
                child: TextFormField(
                  controller: reenteredPasswordController,
                  // ignore: missing_return
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "Your passwords don't match.";
                    }
                    if (value == null || value.isEmpty) {
                      return ("Please reenter your password.");
                    }
                  },
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  obscureText: state.isVisible,
                  onChanged: (String value) {},
                  cursorColor: GoPharmaColors.PrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: GoPharmaColors.PrimaryColor,
                    ),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      color: GoPharmaColors.hintTextColor,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none,
                    suffixIcon: GestureDetector(
                      child: Icon(
                        state.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: GoPharmaColors.PrimaryColor,
                      ),
                      onTap: () {
                        bloc.add(ToggleVisibility());
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                  color: GoPharmaColors.PrimaryColor,
                ),
              ),
              GestureDetector(
                child: Text(
                  " Sign in.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: GoPharmaColors.PrimaryColor,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    DeliveryAgentSignInStart.id,
                  );
                },
              ),
            ],
          ),
          Spacer(),
          BlocBuilder<DeliveryAgentSignUpBloc, DeliveryAgentSignUpState>(
            builder: (context, state) {
              return RoundedButtonFilled(
                title: "Next",
                size: MediaQuery.of(context).size,
                fillColor: GoPharmaColors.PrimaryColor,
                textColor: GoPharmaColors.WhiteColor,
                onTapped: () {
                  _form.currentState.validate();
                  //TODO: backend call
                  bloc.add(NextStepEvent(currentStep: state.step));
                },
              );
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
