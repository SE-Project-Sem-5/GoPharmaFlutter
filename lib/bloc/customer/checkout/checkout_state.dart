import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/dummy/product/product_model.dart';

@immutable
class CheckoutState {
  final String error;
  final List<OrderProduct> productListPrescriptionless;
  final List<OrderProduct> productListNeedPrescriptions;
  final double productListTotal;
  final List<String> localPhotoPaths;
  final List<int> productIDs;
  final List<File> photos;
  final double deliveryCharge;
  final bool orderLoading;

  CheckoutState({
    this.orderLoading = false,
    this.localPhotoPaths,
    this.deliveryCharge,
    this.productIDs,
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
        productIDs: [],
        deliveryCharge: 0,
      );

  CheckoutState clone({
    String error = '',
    List<OrderProduct> productListNeedPrescriptions,
    List<OrderProduct> productListPrescriptionless,
    List<String> localPhotoPaths,
    List<int> productIDs,
    List<File> photos,
    bool orderLoading,
    double deliveryCharge = 0.0,
    productListTotal = 0.0,
  }) {
    return CheckoutState(
      error: error ?? this.error,
      productListPrescriptionless:
          productListPrescriptionless ?? this.productListPrescriptionless,
      productListTotal: productListTotal ?? this.productListTotal,
      orderLoading: orderLoading ?? this.orderLoading,
      localPhotoPaths: localPhotoPaths ?? this.localPhotoPaths,
      photos: photos ?? this.photos,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      productIDs: productIDs ?? this.productIDs,
      productListNeedPrescriptions:
          productListNeedPrescriptions ?? this.productListNeedPrescriptions,
    );
  }
}
