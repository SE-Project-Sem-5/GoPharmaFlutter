import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/product/product_model.dart';

@immutable
class CheckoutState {
  final String error;
  final List<Product> productListPrescriptionless;
  final List<Product> productListNeedPrescriptions;
  final double productListTotal;

  CheckoutState({
    required this.error,
    required this.productListPrescriptionless,
    required this.productListTotal,
    required this.productListNeedPrescriptions,
  });

  static CheckoutState get initialState => CheckoutState(
        error: '',
        productListPrescriptionless: [],
        productListNeedPrescriptions: [],
        productListTotal: 0.0,
      );

  CheckoutState clone({
    String error = '',
    required List<Product> productListNeedPrescriptions,
    required List<Product> productListPrescriptionless,
    productListTotal = 0.0,
  }) {
    return CheckoutState(
      error: error,
      productListPrescriptionless: productListPrescriptionless,
      productListTotal: productListTotal,
      productListNeedPrescriptions: productListNeedPrescriptions,
    );
  }
}
