import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/product/orderProductModel.dart';

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
  final int orderID;
  final String streetAddress;
  final String city;
  final String district;

  CheckoutState({
    this.orderLoading = false,
    this.localPhotoPaths,
    this.deliveryCharge,
    this.orderID,
    this.streetAddress,
    this.city,
    this.district,
    this.productIDs,
    this.photos,
    this.error,
    this.productListPrescriptionless,
    this.productListTotal,
    this.productListNeedPrescriptions,
  });

  static CheckoutState get initialState => CheckoutState(
        error: '',
        streetAddress: '',
        district: '',
        city: '',
        productListPrescriptionless: [],
        productListNeedPrescriptions: [],
        productListTotal: 0.0,
        orderLoading: false,
        orderID: -1,
        localPhotoPaths: [],
        photos: [],
        productIDs: [],
        deliveryCharge: 0,
      );

  CheckoutState clone({
    String error = '',
    String streetAddress,
    String district,
    String city,
    int orderID,
    List<OrderProduct> productListNeedPrescriptions,
    List<OrderProduct> productListPrescriptionless,
    List<String> localPhotoPaths,
    List<int> productIDs,
    List<File> photos,
    bool orderLoading,
    double deliveryCharge,
    double productListTotal,
  }) {
    return CheckoutState(
      error: error ?? this.error,
      streetAddress: streetAddress ?? this.streetAddress,
      district: district ?? this.district,
      city: city ?? this.city,
      orderID: orderID ?? this.orderID,
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
