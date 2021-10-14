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
        yield state.clone(isLoading: true);
        final deliveryAgentID =
            (event as GetAllConfirmedOrders).deliveryAgentID;
        final deliveryAgentAddressID =
            (event as GetAllConfirmedOrders).deliveryAgentAddressID;
        var confirmedOrders =
            await deliveryListAPIProvider.getConfirmedDeliveryOrders(
                deliveryAgentID, deliveryAgentAddressID);
        yield state.clone(
          isLoading: false,
          confirmedOrders: confirmedOrders,
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