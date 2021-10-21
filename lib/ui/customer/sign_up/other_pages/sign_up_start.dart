import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_in/sign_in_provider.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_bloc.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_event.dart';
import 'package:go_pharma/bloc/customer/sign_up/sign_up_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/facebook_button.dart';
import 'package:go_pharma/ui/common/widgets/google_button.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';

class SignUpStart extends StatelessWidget {
  static const String id = "customer_sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController reenteredPasswordController =
      new TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String title = "Enter your email and password";
    final bloc = BlocProvider.of<CustomerSignUpBloc>(context);

    return BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
      builder: (context, state) {
        return state.isLoading
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Form(
                    key: _form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
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
                        BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
                          buildWhen: (p, c) => p.email != c.email,
                          builder: (context, state) {
                            return TextFieldContainer(
                              child: TextFormField(
                                validator: (val) {
                                  final bool isValid = EmailValidator.validate(
                                      emailController.text);
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
                            );
                          },
                        ),
                        BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
                          buildWhen: (previous, current) =>
                              previous.isVisible != current.isVisible,
                          builder: (context, state) {
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
                                      bloc.add(ToggleVisibility());
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
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
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: GoPharmaColors.PrimaryColor,
                                fontSize: 16.0,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                " Sign in.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: GoPharmaColors.PrimaryColor,
                                  fontSize: 16.0,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  CustomerSignInProvider.id,
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<CustomerSignUpBloc, CustomerSignUpState>(
                          builder: (context, state) {
                            return RoundedButtonFilled(
                              title: "Next",
                              size: MediaQuery.of(context).size,
                              fillColor: GoPharmaColors.PrimaryColor,
                              textColor: GoPharmaColors.WhiteColor,
                              onTapped: () {
                                if (_form.currentState.validate()) {
                                  bloc.add(
                                    SignUpStep1(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                  if (state.error == "") {
                                    bloc.add(
                                      NextStepEvent(
                                        currentStep: state.step,
                                        context: context,
                                      ),
                                    );
                                  } else {
                                    print(state.error);
                                  }
                                }
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: GoPharmaColors.PrimaryColor),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  GoogleButton(
                    size: size,
                    onClick: () {},
                    title: 'Join with Google',
                  ),
                  FacebookButton(
                    size: size,
                    onClick: () {},
                    title: 'Join with Facebook',
                  ),
                ],
              );
      },
    );
  }
}
