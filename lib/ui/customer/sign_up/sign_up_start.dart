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
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in_start.dart';

//TODO: password needs to be more than 7 characters
// ignore: must_be_immutable
class CustomerSignUpPage extends StatelessWidget {
  static const String id = "customer_sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController reenteredPasswordController =
      new TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final customerRootBloc = BlocProvider.of<CustomerRootBloc>(context);
    final size = MediaQuery.of(context).size;

    String title = "Enter your email and password";
    return BlocBuilder<CustomerRootBloc, CustomerRootState>(
        builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("SIGN UP"),
          ),
          body: Container(
            child: BlocBuilder<CustomerRootBloc, CustomerRootState>(
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
                                BlocBuilder<CustomerRootBloc,
                                    CustomerRootState>(
                                  builder: (context, state) {
                                    return TextFieldContainer(
                                      child: TextFormField(
                                        validator: (val) {
                                          final bool isValid =
                                              EmailValidator.validate(
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
                                        cursorColor:
                                            GoPharmaColors.PrimaryColor,
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
                                BlocBuilder<CustomerRootBloc,
                                    CustomerRootState>(
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
                                        cursorColor:
                                            GoPharmaColors.PrimaryColor,
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
                                              color:
                                                  GoPharmaColors.PrimaryColor,
                                            ),
                                            onTap: () {
                                              customerRootBloc
                                                  .add(ToggleVisibility());
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                BlocBuilder<CustomerRootBloc,
                                    CustomerRootState>(
                                  buildWhen: (previous, current) =>
                                      previous.isVisible != current.isVisible,
                                  builder: (context, state) {
                                    return TextFieldContainer(
                                      child: TextFormField(
                                        controller: reenteredPasswordController,
                                        // ignore: missing_return
                                        validator: (value) {
                                          if (value !=
                                              passwordController.text) {
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
                                        cursorColor:
                                            GoPharmaColors.PrimaryColor,
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
                                              color:
                                                  GoPharmaColors.PrimaryColor,
                                            ),
                                            onTap: () {
                                              customerRootBloc
                                                  .add(ToggleVisibility());
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
                                          CustomerSignInPage.id,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BlocBuilder<CustomerRootBloc,
                                    CustomerRootState>(
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
            ),
          ),
        ),
      );
    });
  }
}
