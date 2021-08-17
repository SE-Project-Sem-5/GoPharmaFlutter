import 'package:flutter/material.dart';
import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class CheckoutStart extends StatelessWidget {
  static final String id = "checkout_start";
  const CheckoutStart({Key? key}) : super(key: key);

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
              onPressed: () async {
                //TODO: replace with values from logged in user
                Map paymentObject = {
                  "sandbox": true, // true if using Sandbox Merchant ID
                  "merchant_id": "1218333", // Replace your Merchant ID
                  "merchant_secret":
                      "4ua62XyixJR8mz80m5tmP04kpGPJu4vkT4a8dFucI9rg", // See step 4e
                  "notify_url": "https://secret-springs-94446.herokuapp.com/",
                  "order_id": "ItemNo12345",
                  "items": "Hello from Flutter!",
                  "amount": "50.00",
                  "currency": "LKR",
                  "first_name": "Saman",
                  "last_name": "Perera",
                  "email": "samanp@gmail.com",
                  "phone": "0771234567",
                  "address": "No.1, Galle Road",
                  "city": "Colombo",
                  "country": "Sri Lanka",
                  "delivery_address": "No. 46, Galle road, Kalutara South",
                  "delivery_city": "Kalutara",
                  "delivery_country": "Sri Lanka",
                  "custom_1": "",
                  "custom_2": ""
                };

                PayHere.startPayment(paymentObject, (paymentId) {
                  print("====================");
                  print("One Time Payment Success. Payment Id: $paymentId");
                  print("====================");
                }, (error) {
                  print("====================");

                  print("One Time Payment Failed. Error: $error");
                  print("====================");
                }, () {
                  print("====================");

                  print("One Time Payment Dismissed");
                  print("====================");
                });
              },
              child: Text("Pay"),
            ),
          ],
        ),
      ),
    ));
  }
}
