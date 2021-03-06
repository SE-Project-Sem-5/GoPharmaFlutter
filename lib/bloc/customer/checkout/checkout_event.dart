import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/product/product.dart';

@immutable
abstract class CheckoutEvent {}

class ErrorEvent extends CheckoutEvent {
  final String error;

  ErrorEvent(this.error);
}

class UpdateProductListEvent extends CheckoutEvent {
  final Product product;

  UpdateProductListEvent(this.product);
}

class UpdateProductAmountEvent extends CheckoutEvent {
  UpdateProductAmountEvent();
}

class UploadPrescriptionEvent extends CheckoutEvent {
  final String image;
  UploadPrescriptionEvent({this.image});
}

class ConfirmOrderEvent extends CheckoutEvent {
  ConfirmOrderEvent();
}

class RemoveImageEvent extends CheckoutEvent {
  final String image;
  RemoveImageEvent({this.image});
}

class GetDeliveryChargeForNormalOrder extends CheckoutEvent {
  GetDeliveryChargeForNormalOrder();
}

class ConfirmNormalCashOrder extends CheckoutEvent {
  BuildContext context;
  ConfirmNormalCashOrder({this.context});
}

class ConfirmNormalOnlineOrder extends CheckoutEvent {
  BuildContext context;
  ConfirmNormalOnlineOrder({this.context});
}

class AddAddressDetails extends CheckoutEvent {
  final String streetAddress;
  final String city;
  AddAddressDetails({
    this.streetAddress,
    this.city,
  });
}

class GetAllCities extends CheckoutEvent {
  GetAllCities();
}

class UpdateCity extends CheckoutEvent {
  final String city;
  UpdateCity({this.city});
}
