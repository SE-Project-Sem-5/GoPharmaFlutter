import 'package:payhere_mobilesdk_flutter/payhere_mobilesdk_flutter.dart';

class PaymentGateway {
  static void pay({
    List<String> items,
    double totalPrice,
    double deliveryCharge,
    String streetAddress,
    String deliveryCity,
    String deliveryDistrict,
    String address,
    String city,
    String district,
    String contactNumber,
    String email,
    String firstName,
    String lastName,
    int orderID,
  }) {
    print(streetAddress);
    print(deliveryCity);

    Map paymentObject = {
      "sandbox": true, // true if using Sandbox Merchant ID
      "merchant_id": "1218333", // Replace your Merchant ID
      "merchant_secret":
          "4ua62XyixJR8mz80m5tmP04kpGPJu4vkT4a8dFucI9rg", // See step 4e
      "notify_url":
          "http://gopharma.herokuapp.com/api/customer/order/normal/online/payment/confirm",
      "order_id": "GoPharmaOrder",
      "items": items.join(", "),
      "amount": totalPrice.toString(),
      "currency": "LKR",
      "first_name": firstName.toString(),
      "last_name": lastName.toString(),
      "email": email.toString(),
      "phone": contactNumber.toString(),
      "address": address.toString(),
      "city": city.toString(),
      "country": "Sri Lanka",
      "delivery_address": streetAddress,
      "delivery_city": deliveryCity,
      "delivery_country": "Sri Lanka",
      "custom_1": orderID.toString(),
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
