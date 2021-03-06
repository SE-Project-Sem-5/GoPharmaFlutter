import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/ui/delivery_agent/common_skeleton.dart';
import 'package:go_pharma/ui/delivery_agent/returned_orders/orders_to_be_collected_from_customer/return_reserved_delivery_card.dart';

class ReturnReservedDeliveriesPage extends StatelessWidget {
  static final String id = "return_reserved_deliveries_page";
  final String title = "Reserved Deliveries for Return";

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    deliveryListBloc.add(
      GetAllReservedForReturnOrders(),
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
              : state.returnReservedOrders.deliveries.length == 0
                  ? Center(
                      child: Text(
                        "You do not have any reserved deliveries to return at the moment.",
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: state.returnReservedOrders.deliveries.length,
                        itemBuilder: (context, index) =>
                            ReturnReservedDeliveryCard(
                          delivery:
                              state.returnReservedOrders.deliveries[index],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
