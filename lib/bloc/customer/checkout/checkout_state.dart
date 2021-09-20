import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/dummy/product/product_model.dart';

@immutable
class CheckoutState {
  final String error;
  final List<Product> productListPrescriptionless;
  final List<Product> productListNeedPrescriptions;
  final double productListTotal;

  CheckoutState({
    this.error,
    this.productListPrescriptionless,
    this.productListTotal,
    this.productListNeedPrescriptions,
  });

  static CheckoutState get initialState => CheckoutState(
        error: '',
        productListPrescriptionless: [],
        productListNeedPrescriptions: [],
        productListTotal: 0.0,
      );

  CheckoutState clone({
    String error = '',
    List<Product> productListNeedPrescriptions,
    List<Product> productListPrescriptionless,
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
