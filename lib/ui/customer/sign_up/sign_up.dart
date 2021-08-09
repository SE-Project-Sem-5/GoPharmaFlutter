import 'package:flutter/material.dart';
import 'package:go_pharma/generated/l10n.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';
import 'package:go_pharma/ui/common/widgets/text_field.dart';
import 'dart:core';
import 'package:email_validator/email_validator.dart';
import 'package:go_pharma/ui/customer/sign_in/other_files/sign_in_start.dart';

//TODO: password needs to be more than 7 characters
// ignore: must_be_immutable
class SignUpStart extends StatelessWidget {
  static const String id = "sign_up";
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    String title = S.of(context).sign_in_heading;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                title,
              ),
            ],
          ),
        ),
        body: Container(
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
              TextFieldContainer(
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  //TODO: add bloc here
                  obscureText: true,
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
                        Icons.visibility,
                        color: GoPharmaColors.PrimaryColor,
                      ),
                      onTap: () {
                        //      TODO: toggle password visibility
                        print("Tapped");
                      },
                    ),
                  ),
                ),
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
                        SignInStart.id,
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
