import 'package:flutter/material.dart';

import '../drawer.dart';

class CustomerHomePage extends StatelessWidget {
  static const String id = "customer_home_page";

  const CustomerHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Are you sure want to leave?'),
                  actions: [
                    ElevatedButton(
                      child: Text('Yes'),
                      onPressed: () {
                        willLeave = true;
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('No'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ));
        return willLeave;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Home"),
          ),
          drawer: CustomerDrawer(),
        ),
      ),
    );
  }
}
