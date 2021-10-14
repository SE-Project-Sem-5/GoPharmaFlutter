import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/ui/delivery_agent/common_skeleton.dart';
import 'collected_delivery_card.dart';

class CollectedDeliveriesPage extends StatelessWidget {
  //TODO:replace with the list gotten from the backend
  static final String id = "collected_deliveries_page";
  final String title = "Collected Deliveries";

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);

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
              : Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    itemCount: state.confirmedOrders.deliveries.length,
                    itemBuilder: (context, index) => CollectedDeliveryCard(
                      delivery: state.confirmedOrders.deliveries[index],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
