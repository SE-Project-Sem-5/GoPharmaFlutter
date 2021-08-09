import 'package:flutter/material.dart';

import 'components/drawer.dart';

class CustomerHomePage extends StatelessWidget {
  static const String id = "customer_home_page";
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: CustomerDrawer(),
      ),
    );
  }
}
