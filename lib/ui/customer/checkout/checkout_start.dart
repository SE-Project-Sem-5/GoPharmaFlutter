import 'package:flutter/material.dart';

class CheckoutStart extends StatelessWidget {
  static final String id = "checkout_start";
  const CheckoutStart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {},
                child: Text("Pay"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
