import 'package:flutter/material.dart';

class DeliveryAgentHomePage extends StatelessWidget {
  static const id = "delivery_agent_home_page";
  final String title = "Delivery Agent Home Page";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
