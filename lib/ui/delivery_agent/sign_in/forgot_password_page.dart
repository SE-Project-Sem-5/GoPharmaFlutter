import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  static final String id = "forgot_password_page";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password."),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "This functionality is currently not available in the mobile application. "
              "Please visit the GoPharma website for more information.",
              style: TextStyle(
                fontSize: 18.0,
                color: GoPharmaColors.PrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
