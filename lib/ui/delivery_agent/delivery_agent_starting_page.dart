import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/delivery_agent/sign_in/delivery_agent_sign_in.dart';

class DeliveryAgentStartingPage extends StatelessWidget {
  static const String id = "delivery_agent_starting_page";
  const DeliveryAgentStartingPage({Key key}) : super(key: key);

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
                  DeliveryAgentSignInPage.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
