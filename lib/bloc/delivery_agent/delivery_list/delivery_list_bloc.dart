import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/deliveryListAPIProvider.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnCollectedOrderList.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnReservedOrderList.dart';

class DeliveryListBloc extends Bloc<DeliveryListEvent, DeliveryListState> {
  DeliveryListBloc(BuildContext context)
      : super(DeliveryListState.initialState);
  DeliveryListAPIProvider deliveryListAPIProvider =
      new DeliveryListAPIProvider();

  @override
  Stream<DeliveryListState> mapEventToState(DeliveryListEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case GetAllConfirmedOrders:
        yield state.clone(
          isLoading: true,
        );

        var confirmedOrders =
            await deliveryListAPIProvider.getConfirmedDeliveryOrders();
        print(confirmedOrders.deliveries);
        yield state.clone(
          isLoading: false,
          confirmedOrders: confirmedOrders,
        );
        break;
      case GetAllReservedOrders:
        yield state.clone(
          isLoading: true,
        );
        var reservedOrders =
            await deliveryListAPIProvider.getReservedDeliveryOrders();
        print(reservedOrders.deliveries);
        yield state.clone(
          isLoading: false,
          reservedOrders: reservedOrders,
        );
        break;
      case GetAllCollectedOrders:
        yield state.clone(
          isLoading: true,
        );

        var collectedOrders =
            await deliveryListAPIProvider.getCollectedDeliveryOrders();
        yield state.clone(
          isLoading: false,
          collectedOrders: collectedOrders,
        );
        break;
      case GetAllTransientOrders:
        yield state.clone(
          isLoading: true,
        );
        var transientOrders =
            await deliveryListAPIProvider.getAllTransientOrders();
        yield state.clone(isLoading: false, transientOrders: transientOrders);
        break;
      case GetAllTransientCollectedOrders:
        yield state.clone(
          isLoading: true,
        );

        var transientCollectedOrders =
            await deliveryListAPIProvider.getAllTransientCollectedOrders();
        yield state.clone(
          isLoading: false,
          transientCollectedOrders: transientCollectedOrders,
        );
        break;
      case GetAllShippedOrders:
        yield state.clone(
          isLoading: true,
        );
        var shippedOrders = await deliveryListAPIProvider.getAllShippedOrders();
        yield state.clone(
          isLoading: false,
          shippedOrders: shippedOrders,
        );
        break;
      case ReserveOrderForDeliveryEvent:
        yield state.clone(
          isLoading: true,
        );

        final orderProductID =
            (event as ReserveOrderForDeliveryEvent).orderProductID;
        var reservedOrderProduct =
            await deliveryListAPIProvider.reserveOrderProduct(
          orderProductID,
        );

        print(reservedOrderProduct);
        print(reservedOrderProduct.orderID);
        var confirmedOrders =
            await deliveryListAPIProvider.getConfirmedDeliveryOrders();
        print(confirmedOrders.deliveries);
        yield state.clone(
          isLoading: false,
          confirmedOrders: confirmedOrders,
        );
        break;
      case CollectOrderEvent:
        yield state.clone(
          isLoading: true,
        );
        final orderProductID = (event as CollectOrderEvent).orderProductID;
        await deliveryListAPIProvider.collectOrderProduct(
          orderProductID,
        );
        var collectedOrders =
            await deliveryListAPIProvider.getCollectedDeliveryOrders();
        yield state.clone(
          isLoading: false,
          collectedOrders: collectedOrders,
        );
        break;
      case TransitionOrderEvent:
        yield state.clone(
          isLoading: true,
        );
        final orderID = (event as TransitionOrderEvent).orderID;
        await deliveryListAPIProvider.transientOrder(
          orderID,
        );
        var collectedOrders =
            await deliveryListAPIProvider.getCollectedDeliveryOrders();
        print(collectedOrders);
        yield state.clone(
          isLoading: false,
          collectedOrders: collectedOrders,
        );
        break;
      case TransitionCollectOrderEvent:
        yield state.clone(
          isLoading: true,
        );
        final orderID = (event as TransitionCollectOrderEvent).orderID;
        await deliveryListAPIProvider.transientCollectOrder(
          orderID,
        );
        var transientOrders =
            await deliveryListAPIProvider.getAllTransientOrders();
        print(transientOrders);
        yield state.clone(
          isLoading: false,
          transientOrders: transientOrders,
        );
        break;
      case ShipOrderEvent:
        yield state.clone(
          isLoading: true,
        );
        final orderID = (event as ShipOrderEvent).orderID;
        await deliveryListAPIProvider.shipOrder(
          orderID,
        );
        var transientCollectedOrders =
            await deliveryListAPIProvider.getAllTransientCollectedOrders();
        print(transientCollectedOrders);
        yield state.clone(
          isLoading: false,
          transientCollectedOrders: transientCollectedOrders,
        );
        break;
      case DeliverCashOrder:
        yield state.clone(
          isLoading: true,
        );
        final orderID = (event as DeliverCashOrder).orderID;
        final amountPaid = (event as DeliverCashOrder).amountPaid;
        final checkoutDiscount = (event as DeliverCashOrder).checkoutDiscount;
        final currency = (event as DeliverCashOrder).currency;
        final customerEmail = (event as DeliverCashOrder).customerEmail;
        final customerID = (event as DeliverCashOrder).customerID;
        await deliveryListAPIProvider.deliverCashOrder(
          orderID: orderID,
          amountPaid: amountPaid,
          checkoutDiscount: checkoutDiscount,
          currency: currency,
          customerEmail: customerEmail,
          customerID: customerID,
        );
        var shippedOrders = await deliveryListAPIProvider.getAllShippedOrders();
        yield state.clone(
          isLoading: false,
          shippedOrders: shippedOrders,
        );
        break;
      case DeliverOnlineOrder:
        yield state.clone(
          isLoading: true,
        );
        final orderID = (event as DeliverOnlineOrder).orderID;
        await deliveryListAPIProvider.deliverOnlineOrder(
          orderID,
        );
        var shippedOrders = await deliveryListAPIProvider.getAllShippedOrders();
        yield state.clone(
          isLoading: false,
          shippedOrders: shippedOrders,
        );
        break;

      //    RETURNED ORDERS

      case GetAllReturnOrdersAvailableForReservation:
        yield state.clone(
          isLoading: true,
        );
        ReturnToBeReservedOrderList orders =
            await deliveryListAPIProvider.getAllReturnedToBeReservedOrders();
        print(orders.deliveries);
        yield state.clone(
          isLoading: false,
          returnToBeReservedOrders: orders,
        );
        break;
      case ReserveOrderForReturn:
        yield state.clone(
          isLoading: true,
        );
        final orderProductID = (event as ReserveOrderForReturn).orderProductID;
        await deliveryListAPIProvider.reserveOrderForReturn(orderProductID);
        ReturnToBeReservedOrderList orders =
            await deliveryListAPIProvider.getAllReturnedToBeReservedOrders();
        yield state.clone(
          isLoading: false,
          returnToBeReservedOrders: orders,
        );
        break;

      case GetAllReservedForReturnOrders:
        yield state.clone(
          isLoading: true,
        );
        ReturnCollectedOrderList orders =
            await deliveryListAPIProvider.getAllReservedForCollectionOrders();
        yield state.clone(
          isLoading: false,
          returnReservedOrders: orders,
        );
        break;

      case CollectOrderForReturn:
        yield state.clone(
          isLoading: true,
        );
        final orderProductID = (event as CollectOrderForReturn).orderProductID;
        await deliveryListAPIProvider.collectOrderForReturn(orderProductID);
        ReturnCollectedOrderList orders =
            await deliveryListAPIProvider.getAllReservedForCollectionOrders();
        yield state.clone(
          isLoading: false,
          returnReservedOrders: orders,
        );
        break;

      case GetAllReturnCollectedOrders:
        yield state.clone(
          isLoading: true,
        );
        ReturnCollectedOrderList orders =
            await deliveryListAPIProvider.getAllReturnCollectedOrders();
        yield state.clone(
          isLoading: false,
          returnCollectedOrders: orders,
        );
        break;

      case ConfirmOrderReturn:
        yield state.clone(
          isLoading: true,
        );
        final orderProductID = (event as ConfirmOrderReturn).orderProductID;
        await deliveryListAPIProvider.returnOrderToCustomer(orderProductID);
        ReturnCollectedOrderList orders =
            await deliveryListAPIProvider.getAllReturnCollectedOrders();
        yield state.clone(
          isLoading: false,
          returnCollectedOrders: orders,
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
