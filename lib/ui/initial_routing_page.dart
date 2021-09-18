import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_bloc.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/customer_starting_page.dart';
import 'common/widgets/rounded_button.dart';
import 'delivery_agent/delivery_agent_starting_page.dart';

class InitialRoutingPage extends StatelessWidget {
  static const id = "initial_routing_page";
  final String title = "Welcome to GoPharma!";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocListener<InternetBloc, InternetState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.connection.toString(),
              ),
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(title),
              ],
            ),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Are you a customer, or a delivery agent?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RoundedButtonFilled(
                  title: "CUSTOMER",
                  size: size,
                  onTapped: () => Navigator.pushReplacementNamed(
                    context,
                    CustomerStartingPage.id,
                  ),
                ),
                RoundedButtonFilled(
                  title: "DELIVERY AGENT",
                  size: size,
                  fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                  textColor: GoPharmaColors.BlackColor,
                  onTapped: () => Navigator.pushReplacementNamed(
                    context,
                    DeliveryAgentStartingPage.id,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
