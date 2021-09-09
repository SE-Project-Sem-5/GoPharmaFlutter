import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';
import 'package:go_pharma/generated/l10n.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in.dart';

//TODO: password needs to be more than 7 characters
// ignore: must_be_immutable
class CustomerSignUpStart extends StatelessWidget {
  static const String id = "customer_sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String title = S.of(context).sign_up_heading;

    return BlocProvider(
      create: (context) => CustomerSignUpBloc(context),
      child: CommonSkeleton(
        title: title,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: GoPharmaColors.PrimaryColor),
              ),
              Spacer(),
              TextFieldContainer(
                child: TextField(
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
                    hintText: S.of(context).your_email,
                    hintStyle: TextStyle(
                      color: GoPharmaColors.hintTextColor,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
                builder: (context, state) {
                  final bloc = BlocProvider.of<CustomerSignUpBloc>(context);
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
                        hintText: S.of(context).password,
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
                            bloc.add(
                              ToggleVisibility(
                                !state.isVisible,
                              ),
                            );
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
                      Navigator.pushNamed(
                        context,
                        CustomerSignInStart.id,
                      );
                    },
                  ),
                ],
              ),
              Spacer(),
              RoundedButtonFilled(
                title: S.of(context).sign_up_button,
                size: MediaQuery.of(context).size,
                fillColor: GoPharmaColors.PrimaryColor,
                textColor: GoPharmaColors.WhiteColor,
                onTapped: () {
                  final bool isValid =
                      EmailValidator.validate(emailController.text);
                  print(isValid);
                  Navigator.pushNamed(
                    context,
                    CustomerHomePage.id,
                  );
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
