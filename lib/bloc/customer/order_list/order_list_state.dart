import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/normalOrderList.dart';
import 'package:go_pharma/repos/customer/actual/order/prescriptionOrderList.dart';

@immutable
class OrderListState {
  final String error;
  final Map<String, NormalOrderList> normalOrderList;
  final String status;
  final bool isLoading;
  final PrescriptionOrderList prescriptionOrderList;
  OrderListState({
    this.error,
    this.status,
    this.normalOrderList,
    this.prescriptionOrderList,
    this.isLoading,
  });

  static OrderListState get initialState => OrderListState(
        error: '',
        status: '',
        normalOrderList: {},
        isLoading: false,
        prescriptionOrderList: new PrescriptionOrderList(),
      );

  OrderListState clone({
    String error = '',
    Map<String, NormalOrderList> normalOrderList,
    String status,
    bool isLoading,
    PrescriptionOrderList prescriptionOrderList,
  }) {
    return OrderListState(
      error: error ?? this.error,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      prescriptionOrderList:
          prescriptionOrderList ?? this.prescriptionOrderList,
      normalOrderList: normalOrderList ?? this.normalOrderList,
    );
  }
}
