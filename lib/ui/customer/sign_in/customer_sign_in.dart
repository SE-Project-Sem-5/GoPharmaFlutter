import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_event.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_state.dart';
import 'package:go_pharma/generated/l10n.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';
import 'package:go_pharma/ui/customer/sign_up/customer_sign_up.dart';

class CustomerSignInStart extends StatelessWidget {
  static const String id = "customer_sign_in";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  static final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String title = S.of(context).sign_in_heading;

    return BlocProvider(
      create: (context) => CustomerSignInBloc(context),
      child: CommonSkeleton(
        title: title,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  S.of(context).sign_in_to_your_account,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: GoPharmaColors.PrimaryColor),
                ),
                Spacer(),
                TextFieldContainer(
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ("Please type in your email address.");
                      } else if (!EmailValidator.validate(
                          emailController.text)) {
                        return ("Please type in a valid email address");
                      }
                    },
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
                BlocBuilder<CustomerSignInBloc, CustomerSignInState>(
                  builder: (context, state) {
                    final bloc = BlocProvider.of<CustomerSignInBloc>(context);
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
                      S.of(context).no_account_text,
                      style: TextStyle(
                        color: GoPharmaColors.PrimaryColor,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        S.of(context).sign_up_text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: GoPharmaColors.PrimaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          CustomerSignUpStart.id,
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
                    // if (_form.currentState!.validate()) {
                    Navigator.pushNamed(
                      context,
                      CustomerHomePage.id,
                    );
                    // }
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
