import 'package:flutter/material.dart';
import 'package:go_pharma/repos/product/product_model.dart';

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

class UploadPrescriptionEvent extends CheckoutEvent {}
