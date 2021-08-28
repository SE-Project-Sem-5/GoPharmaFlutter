import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class PaymentGateway {
  /*
  *
  **/
  static void pay(
    List<String> items,
    double amount,
    // Customer customer,
    String orderID,
  ) {
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
  }
}
