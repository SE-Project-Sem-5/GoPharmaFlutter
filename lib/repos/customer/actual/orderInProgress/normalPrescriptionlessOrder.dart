import 'address.dart';

class NormalPrescriptionlessOrder {
  double totalPrice;
  double deliveryCharge;
  int customerID;
  String customerEmail;
  String orderType;
  List<OrderConfirmationProducts> products;
  Address address;
  Payment payment;

  NormalPrescriptionlessOrder({
    this.totalPrice,
    this.deliveryCharge,
    this.customerID,
    this.customerEmail,
    this.orderType,
    this.products,
    this.address,
    this.payment,
  });

  NormalPrescriptionlessOrder.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    deliveryCharge = json['deliveryCharge'];
    customerID = json['customerID'];
    customerEmail = json['customerEmail'];
    orderType = json['orderType'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(new OrderConfirmationProducts.fromJson(v));
      });
    }
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    payment =
        json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPrice'] = this.totalPrice;
    data['deliveryCharge'] = this.deliveryCharge;
    data['customerID'] = this.customerID;
    data['customerEmail'] = this.customerEmail;
    data['orderType'] = this.orderType;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment.toJson();
    }
    return data;
  }
}

class OrderConfirmationProducts {
  String productID;
  int quantity;
  double soldUnitPrice;
  int supplierID;
  int addedChargePercentage;
  int addedCharge;

  OrderConfirmationProducts({
    this.productID,
    this.quantity,
    this.soldUnitPrice,
    this.supplierID,
    this.addedChargePercentage,
    this.addedCharge,
  });

  OrderConfirmationProducts.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    quantity = json['quantity'];
    soldUnitPrice = json['soldUnitPrice'];
    supplierID = json['supplierID'];
    addedChargePercentage = json['addedChargePercentage'];
    addedCharge = json['addedCharge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productID'] = this.productID;
    data['quantity'] = this.quantity;
    data['soldUnitPrice'] = this.soldUnitPrice;
    data['supplierID'] = this.supplierID;
    data['addedChargePercentage'] = this.addedChargePercentage;
    data['addedCharge'] = this.addedCharge;
    return data;
  }
}

class Payment {
  int checkoutDiscount;
  String payhereCurrency;
  String method;
  int paymentAmount;

  Payment(
      {this.checkoutDiscount,
      this.payhereCurrency,
      this.method,
      this.paymentAmount});

  Payment.fromJson(Map<String, dynamic> json) {
    checkoutDiscount = json['checkout_discount'];
    payhereCurrency = json['payhere_currency'];
    method = json['method'];
    paymentAmount = json['payment_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['checkout_discount'] = this.checkoutDiscount;
    data['payhere_currency'] = this.payhereCurrency;
    data['method'] = this.method;
    data['payment_amount'] = this.paymentAmount;
    return data;
  }
}
