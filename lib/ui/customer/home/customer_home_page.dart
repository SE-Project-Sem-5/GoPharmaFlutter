import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/camera/camera_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';

import '../drawer.dart';

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
