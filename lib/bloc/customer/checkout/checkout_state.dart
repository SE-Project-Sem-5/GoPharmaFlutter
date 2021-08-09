import 'package:flutter/material.dart';
import 'package:go_pharma/repos/product/product_model.dart';

@immutable
class CheckoutState {
  final String error;
  final List<Product> productList;
  final double productListTotal;

  CheckoutState({
    required this.error,
    required this.productList,
    required this.productListTotal,
  });

  static CheckoutState get initialState => CheckoutState(
        error: '',
        productList: [],
        productListTotal: 0.0,
      );

  CheckoutState clone({
    String error = '',
    required List<Product> productList,
    productListTotal = 0.0,
  }) {
    return CheckoutState(
      error: error,
      productList: productList,
      productListTotal: productListTotal,
    );
  }
}
