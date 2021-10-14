import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/deliveryListModel.dart';
import 'delivery_card.dart';

class DeliveriesPage extends StatelessWidget {
  //TODO:replace with the list gotten from the backend
  static final String id = "deliveries_page";
  final String title = "Deliveries";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeliveryListBloc, DeliveryListState>(
      builder: (context, state) {
        List<Delivery> deliveries = state.confirmedOrders.deliveries;
        return Container(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: deliveries.length,
            itemBuilder: (context, index) => DeliveryCard(
              delivery: deliveries[index],
            ),
          ),
        );
      },
    );
  }
}
