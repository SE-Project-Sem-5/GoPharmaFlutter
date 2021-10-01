import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/delivery_agent/dummy_values/deliveries.dart';
import 'pending_delivery_card.dart';

class PendingDeliveriesPage extends StatelessWidget {
  //TODO:replace with the list gotten from the backend
  List<Delivery> deliveries = dummyPendingDeliveries;
  static final String id = "pending_deliveries_page";
  final String title = "Pending Deliveries";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: deliveries.length,
        itemBuilder: (context, index) => PendingDeliveryCard(
          delivery: deliveries[index],
        ),
      ),
    );
  }
}
