import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_agent_root/delivery_agent_root_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';
import 'forgot_password_page.dart';

// ignore: must_be_immutable
class DeliveryAgentSignInPage extends StatelessWidget {
  static const String id = "devliery_agent_sign_in";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DeliveryAgentRootBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocBuilder<DeliveryAgentRootBloc, DeliveryAgentRootState>(
        builder: (context, state) {
      return state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
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
                              height: 70,
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
                            BlocBuilder<DeliveryAgentRootBloc,
                                DeliveryAgentRootState>(
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
                            BlocBuilder<DeliveryAgentRootBloc,
                                DeliveryAgentRootState>(
                              builder: (context, state) {
                                return RoundedButtonFilled(
                                  title: "Next",
                                  size: MediaQuery.of(context).size,
                                  fillColor: GoPharmaColors.PrimaryColor,
                                  textColor: GoPharmaColors.WhiteColor,
                                  onTapped: () {
                                    if (_form.currentState.validate()) {
                                      bloc.add(
                                        LoginUser(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        ),
                                      );
                                    }
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
                              onTapped: () {
                                Navigator.pushNamed(
                                  context,
                                  ForgotPasswordPage.id,
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
    });
  }
}
