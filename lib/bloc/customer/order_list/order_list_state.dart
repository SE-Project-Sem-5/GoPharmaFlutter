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
  final String cookie;
  OrderListState({
    this.error,
    this.cookie,
    this.status,
    this.normalOrderList,
    this.prescriptionOrderList,
    this.isLoading,
  });

  static OrderListState get initialState => OrderListState(
        error: '',
        status: '',
        cookie: '',
        normalOrderList: {
          "delivered": new NormalOrderList(orders: []),
          "processing": new NormalOrderList(orders: []),
          "confirmed": new NormalOrderList(orders: []),
          "reserved": new NormalOrderList(orders: []),
          "collected": new NormalOrderList(orders: []),
          "transient": new NormalOrderList(orders: []),
          "transient-collected": new NormalOrderList(orders: []),
          "shipped": new NormalOrderList(orders: []),
        },
        isLoading: false,
        prescriptionOrderList: new PrescriptionOrderList(),
      );

  OrderListState clone({
    String error = '',
    Map<String, NormalOrderList> normalOrderList,
    String status,
    String cookie,
    bool isLoading,
    PrescriptionOrderList prescriptionOrderList,
  }) {
    return OrderListState(
      error: error ?? this.error,
      cookie: cookie ?? this.cookie,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      prescriptionOrderList:
          prescriptionOrderList ?? this.prescriptionOrderList,
      normalOrderList: normalOrderList ?? this.normalOrderList,
    );
  }
}
