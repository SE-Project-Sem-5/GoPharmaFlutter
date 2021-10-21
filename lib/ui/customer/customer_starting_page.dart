import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/sign_in/customer_sign_in_start.dart';
import 'package:go_pharma/ui/customer/sign_up/sign_up_start.dart';

class CustomerStartingPage extends StatelessWidget {
  static const String id = "customer_starting_page";
  const CustomerStartingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to GoPharma!"),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedButtonFilled(
                title: "LOGIN",
                size: size,
                onTapped: () {
                  Navigator.pushNamed(
                    context,
                    CustomerSignInPage.id,
                  );
                },
              ),
              RoundedButtonFilled(
                  title: "SIGN UP",
                  size: size,
                  fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                  textColor: GoPharmaColors.BlackColor,
                  onTapped: () {
                    Navigator.pushNamed(
                      context,
                      CustomerSignUpPage.id,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
