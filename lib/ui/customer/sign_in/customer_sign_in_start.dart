import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_bloc.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_event.dart';
import 'package:go_pharma/bloc/customer/customer_root/customer_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/facebook_button.dart';
import 'package:go_pharma/ui/common/widgets/google_button.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';
import 'package:go_pharma/ui/customer/sign_up/sign_up_start.dart';

// ignore: must_be_immutable
class CustomerSignInPage extends StatelessWidget {
  static const String id = "customer_sign_in";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final customerRootBloc = BlocProvider.of<CustomerRootBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CustomerRootBloc, CustomerRootState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("SIGN IN"),
          ),
          body: Container(
            child: Column(
              children: [
                Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        "Sign in to your account.",
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
                          controller: emailController,
                          // ignore: missing_return
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
                            hintText: "Your email",
                            hintStyle: TextStyle(
                              color: GoPharmaColors.hintTextColor,
                              fontSize: 18.0,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      BlocBuilder<CustomerRootBloc, CustomerRootState>(
                        buildWhen: (previous, current) =>
                            previous.isVisible != current.isVisible,
                        builder: (context, state) {
                          final bloc =
                              BlocProvider.of<CustomerRootBloc>(context);
                          return TextFieldContainer(
                            child: TextFormField(
                              controller: passwordController,
                              //ignore: missing_return
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
                                    bloc.add(
                                      ToggleVisibility(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: GoPharmaColors.PrimaryColor,
                              fontSize: 16.0,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Sign up.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: GoPharmaColors.PrimaryColor,
                                fontSize: 16.0,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                CustomerSignUpPage.id,
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      BlocBuilder<CustomerRootBloc, CustomerRootState>(
                        builder: (context, state) {
                          return RoundedButtonFilled(
                            title: "Next",
                            size: MediaQuery.of(context).size,
                            fillColor: GoPharmaColors.PrimaryColor,
                            textColor: GoPharmaColors.WhiteColor,
                            onTapped: () {
                              if (_form.currentState.validate()) {}
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RoundedButtonFilled(
                        title: "Forgot Password?",
                        size: MediaQuery.of(context).size,
                        fillColor: GoPharmaColors.GreyColor,
                        textColor: GoPharmaColors.BlackColor,
                        onTapped: () {},
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: GoPharmaColors.PrimaryColor),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                GoogleButton(
                  size: size,
                  onClick: () {},
                  title: 'Sign in with Google',
                ),
                SizedBox(
                  height: 20,
                ),
                FacebookButton(
                  size: size,
                  onClick: () {},
                  title: 'Sign in with Facebook',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
