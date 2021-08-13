import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button.dart';
import 'package:go_pharma/ui/customer/sign_in/other_files/sign_in_start.dart';
import 'package:go_pharma/ui/customer/sign_up/customer_sign_up.dart';

import 'camera/select_photo_screen.dart';
import 'customer_home_page.dart';

class CustomerStartingPage extends StatelessWidget {
  static const String id = "customer_starting_page";
  const CustomerStartingPage({Key? key}) : super(key: key);

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
                onTapped: () => Navigator.pushNamed(
                  context,
                  CustomerSignInStart.id,
                ),
              ),
              RoundedButtonFilled(
                title: "SIGN UP",
                size: size,
                fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                textColor: GoPharmaColors.BlackColor,
                onTapped: () => Navigator.pushNamed(
                  context,
                  CustomerSignUpStart.id,
                ),
              ),
              RoundedButtonFilled(
                title: "CUSTOMER HOME PAGE",
                size: size,
                fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                textColor: GoPharmaColors.BlackColor,
                onTapped: () => Navigator.pushNamed(
                  context,
                  CustomerHomePage.id,
                ),
              ),
              RoundedButtonFilled(
                title: "CAMERA SCREEN",
                size: size,
                fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                textColor: GoPharmaColors.BlackColor,
                onTapped: () => Navigator.pushNamed(
                  context,
                  SelectPhotoScreen.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
