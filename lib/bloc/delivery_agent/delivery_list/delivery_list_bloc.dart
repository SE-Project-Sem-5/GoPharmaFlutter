import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/deliveryListAPIProvider.dart';

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
        final deliveryAgentID =
            (event as GetAllConfirmedOrders).deliveryAgentID;
        final deliveryAgentHomeAddressID =
            (event as GetAllConfirmedOrders).deliveryAgentHomeAddressID;
        var confirmedOrders =
            await deliveryListAPIProvider.getConfirmedDeliveryOrders(
          deliveryAgentID,
          deliveryAgentHomeAddressID,
        );
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
        final deliveryAgentID = (event as GetAllReservedOrders).deliveryAgentID;
        var reservedOrders =
            await deliveryListAPIProvider.getReservedDeliveryOrders(
          deliveryAgentID,
        );
        print(reservedOrders);
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
        final deliveryAgentHomeAddressID =
            (event as GetAllCollectedOrders).deliveryAgentHomeAddressID;
        var collectedOrders =
            await deliveryListAPIProvider.getCollectedDeliveryOrders(
          deliveryAgentHomeAddressID,
        );
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
        final deliveryAgentID =
            (event as GetAllTransientCollectedOrders).deliveryAgentID;
        var transientCollectedOrders = await deliveryListAPIProvider
            .getAllTransientCollectedOrders(deliveryAgentID);
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
        final deliveryAgentID =
            (event as ReserveOrderForDeliveryEvent).deliveryAgentID;
        final orderProductID =
            (event as ReserveOrderForDeliveryEvent).orderProductID;
        var reservedOrderProduct =
            await deliveryListAPIProvider.reserveOrderProduct(
          deliveryAgentID,
          orderProductID,
        );
        final deliveryAgentHomeAddressID =
            (event as ReserveOrderForDeliveryEvent).deliveryAgentHomeAddressID;
        print(reservedOrderProduct);
        print(reservedOrderProduct.orderID);
        var confirmedOrders =
            await deliveryListAPIProvider.getConfirmedDeliveryOrders(
          deliveryAgentID,
          deliveryAgentHomeAddressID,
        );
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
        final deliveryAgentID = (event as CollectOrderEvent).deliveryAgentID;
        final orderProductID = (event as CollectOrderEvent).orderProductID;
        final deliveryAgentHomeAddressID =
            (event as CollectOrderEvent).deliveryAgentHomeAddressID;
        await deliveryListAPIProvider.collectOrderProduct(
          deliveryAgentID,
          orderProductID,
        );
        var collectedOrders =
            await deliveryListAPIProvider.getCollectedDeliveryOrders(
          deliveryAgentHomeAddressID,
        );
        yield state.clone(
          isLoading: false,
          collectedOrders: collectedOrders,
        );
        break;
      case TransitionOrderEvent:
        yield state.clone(
          isLoading: true,
        );
        final deliveryAgentID = (event as TransitionOrderEvent).deliveryAgentID;
        final orderID = (event as TransitionOrderEvent).orderID;
        final deliveryAgentHomeAddressID =
            (event as TransitionOrderEvent).deliveryAgentHomeAddressID;
        await deliveryListAPIProvider.transientOrder(
          deliveryAgentID,
          orderID,
        );
        var collectedOrders =
            await deliveryListAPIProvider.getCollectedDeliveryOrders(
          deliveryAgentHomeAddressID,
        );
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
        final deliveryAgentID =
            (event as TransitionCollectOrderEvent).deliveryAgentID;
        final orderID = (event as TransitionCollectOrderEvent).orderID;
        await deliveryListAPIProvider.transientCollectOrder(
          deliveryAgentID,
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
        final deliveryAgentID = (event as ShipOrderEvent).deliveryAgentID;
        final orderID = (event as ShipOrderEvent).orderID;
        await deliveryListAPIProvider.shipOrder(
          deliveryAgentID,
          orderID,
        );
        var transientCollectedOrders = await deliveryListAPIProvider
            .getAllTransientCollectedOrders(deliveryAgentID);
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
        final deliveryAgentID = (event as DeliverCashOrder).deliveryAgentID;
        final orderID = (event as DeliverCashOrder).orderID;
        final amountPaid = (event as DeliverCashOrder).amountPaid;
        final checkoutDiscount = (event as DeliverCashOrder).checkoutDiscount;
        final currency = (event as DeliverCashOrder).currency;
        final customerEmail = (event as DeliverCashOrder).customerEmail;
        final customerID = (event as DeliverCashOrder).customerID;
        await deliveryListAPIProvider.deliverCashOrder(
          deliveryAgentID: deliveryAgentID,
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
        final deliveryAgentID = (event as DeliverOnlineOrder).deliveryAgentID;
        final orderID = (event as DeliverOnlineOrder).orderID;
        await deliveryListAPIProvider.deliverOnlineOrder(
          deliveryAgentID,
          orderID,
        );
        var shippedOrders = await deliveryListAPIProvider.getAllShippedOrders();
        yield state.clone(
          isLoading: false,
          shippedOrders: shippedOrders,
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
