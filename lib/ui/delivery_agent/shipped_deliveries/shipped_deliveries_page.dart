import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/ui/delivery_agent/common_skeleton.dart';
import 'shipped_delivery_card.dart';

class ShippedDeliveriesPage extends StatelessWidget {
  static final String id = "shipped_deliveries_page";
  final String title = "Shipped Deliveries";

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    deliveryListBloc.add(
      GetAllShippedOrders(),
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
              : state.shippedOrders.deliveries.length == 0
                  ? Center(
                      child: Text(
                        "You have not been assigned any customer deliveries at the moment.",
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: state.shippedOrders.deliveries.length,
                        itemBuilder: (context, index) => ShippedDeliveryCard(
                          delivery: state.shippedOrders.deliveries[index],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
