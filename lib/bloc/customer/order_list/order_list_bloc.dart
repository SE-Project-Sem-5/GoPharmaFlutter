import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';
import 'package:go_pharma/repos/customer/actual/order/orderListAPIProvider.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  OrderListAPIProvider orderListAPIProvider = new OrderListAPIProvider();
  OrderListBloc(BuildContext context) : super(OrderListState.initialState);

  @override
  Stream<OrderListState> mapEventToState(OrderListEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case GetOrderListByStatus:
        final status = (event as GetOrderListByStatus).status;
        //TODO: replace by customerID
        final OrderList orderList =
            await orderListAPIProvider.getOrderByStatus(2, status);
        var orderMapping = state.orderList;
        orderMapping["status"] = orderList;
        yield state.clone(
          orderList: orderMapping,
        );
        break;
      case GetAllOrders:
        //TODO: replace by customerID
        final OrderList orderListResponse =
            await orderListAPIProvider.getAllOrders(2);
        Map<String, OrderList> orderList = {};
        for (String status in statuses) {
          orderList[status] = new OrderList();
        }
        for (Orders order in orderListResponse.orders) {
          orderList[order.status].orders.add(order);
        }
        print(orderList);
        yield state.clone(
          orderList: orderList,
        );
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}

List<String> statuses = [
  'processing',
  'cancelled',
  'confirmed',
  'reserved',
  'collected',
  'transient',
  'transient-collected',
  'shipped',
  'delivered',
];
