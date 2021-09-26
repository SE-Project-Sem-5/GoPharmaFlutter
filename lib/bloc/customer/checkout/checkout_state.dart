import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/dummy/product/product_model.dart';

@immutable
class CheckoutState {
  final String error;
  final List<Product> productListPrescriptionless;
  final List<Product> productListNeedPrescriptions;
  final double productListTotal;
  final List<String> localPhotoPaths;
  final List<File> photos;
  final bool orderLoading;

  CheckoutState({
    this.orderLoading = false,
    this.localPhotoPaths,
    this.photos,
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
        orderLoading: false,
        localPhotoPaths: [],
        photos: [],
      );

  CheckoutState clone({
    String error = '',
    List<Product> productListNeedPrescriptions,
    List<Product> productListPrescriptionless,
    List<String> localPhotoPaths,
    List<File> photos,
    bool orderLoading,
    productListTotal = 0.0,
  }) {
    return CheckoutState(
      error: error,
      productListPrescriptionless:
          productListPrescriptionless ?? this.productListPrescriptionless,
      productListTotal: productListTotal ?? this.productListTotal,
      orderLoading: orderLoading ?? this.orderLoading,
      localPhotoPaths: localPhotoPaths ?? this.localPhotoPaths,
      photos: photos ?? this.photos,
      productListNeedPrescriptions:
          productListNeedPrescriptions ?? this.productListNeedPrescriptions,
    );
  }
}
