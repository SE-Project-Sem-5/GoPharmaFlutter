import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerHomePage extends StatelessWidget {
  static const id = "customer_home_page";
  final String title = "Customer Home Page";

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
