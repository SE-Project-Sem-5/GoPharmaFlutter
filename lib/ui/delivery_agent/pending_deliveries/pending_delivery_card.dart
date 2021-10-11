import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_delivery_full_view.dart';

class PendingDeliveryCard extends StatelessWidget {
  final Delivery delivery;

  const PendingDeliveryCard({this.delivery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.article_rounded,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(delivery.id),
                  Text(
                    "Rs. " + delivery.totalPrice.toStringAsFixed(2),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('View Delivery Details'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => DeliveryBloc(context),
                          child: PendingDeliveryFullView(
                            delivery: delivery,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}