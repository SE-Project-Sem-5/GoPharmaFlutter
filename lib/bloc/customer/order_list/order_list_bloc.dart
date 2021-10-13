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
        yield state.clone(
          isLoading: true,
        );
        final status = (event as GetOrderListByStatus).status;
        final customerID = (event as GetOrderListByStatus).customerID;
        //TODO: replace by customerID
        final OrderList orderList =
            await orderListAPIProvider.getOrderByStatus(customerID, status);
        var orderMapping = state.orderList;
        orderMapping[status] = orderList;
        yield state.clone(
          isLoading: false,
          orderList: orderMapping,
        );
        break;
      case GetAllOrders:
        yield state.clone(
          isLoading: true,
        );
        final customerID = (event as GetAllOrders).customerID;
        var orderListResponse =
            await orderListAPIProvider.getAllOrders(customerID);
        print(orderListResponse);
        Map<String, OrderList> orderList = {};
        for (String status in statuses) {
          orderList[status] = new OrderList();
          orderList[status].orders = [];
        }
        for (Orders order in orderListResponse.orders) {
          orderList[order.status].orders.add(order);
        }
        print(orderList);
        yield state.clone(
          isLoading: false,
          orderList: orderList,
        );
        break;
      case CancelOrder:
        yield state.clone(
          isLoading: true,
        );
        final customerID = (event as CancelOrder).customerID;
        final orderID = (event as CancelOrder).orderID;
        var orderResponse =
            await orderListAPIProvider.cancelOrder(customerID, orderID);
        print(orderResponse);
        yield state.clone(
          isLoading: false,
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
