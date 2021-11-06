import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/ui/delivery_agent/common_skeleton.dart';
import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_delivery_full_view.dart';

class PendingDeliveriesPage extends StatelessWidget {
  static final String id = "pending_deliveries_page";
  final String title = "Pending Deliveries";

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    deliveryListBloc.add(
      GetAllConfirmedOrders(),
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
              : state.confirmedOrders.deliveries.length == 0
                  ? Center(
                      child: Text(
                        "You do not have any pending deliveries at the moment.",
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: state.confirmedOrders.deliveries.length,
                        itemBuilder: (context, index) =>
                            PendingDeliveryFullView(
                          delivery: state.confirmedOrders.deliveries[index],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
