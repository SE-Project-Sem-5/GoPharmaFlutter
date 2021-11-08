import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/ui/delivery_agent/common_skeleton.dart';
import 'package:go_pharma/ui/delivery_agent/returned_orders/orders_available_for_reservation/return_to_be_reserved_delivery_card.dart';

class ReturnToBeReservedDeliveriesPage extends StatelessWidget {
  static final String id = "return_reservable_deliveries_page";
  final String title = "Reservable Deliveries for Return";

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    deliveryListBloc.add(
      GetAllReturnOrdersAvailableForReservation(),
    );
    return CommonSkeleton(
      title: title,
      child: BlocBuilder<DeliveryListBloc, DeliveryListState>(
        builder: (context, state) {
          return state.isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : state.returnToBeReservedOrders.deliveries.length == 0
                  ? Center(
                      child: Text(
                        "You do not have any deliveries to reserve at the moment.",
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount:
                            state.returnToBeReservedOrders.deliveries.length,
                        itemBuilder: (context, index) =>
                            ReturnToBeReservedDeliveryCard(
                          delivery:
                              state.returnToBeReservedOrders.deliveries[index],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
