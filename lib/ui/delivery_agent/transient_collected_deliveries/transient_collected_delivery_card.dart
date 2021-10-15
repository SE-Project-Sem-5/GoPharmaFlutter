import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientCollectedList.dart';
import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_delivery_full_view.dart';
import 'package:go_pharma/ui/delivery_agent/transient_collected_deliveries/transient_collected_delivery_full_view.dart';

class TransientCollectedDeliveryCard extends StatelessWidget {
  final TransientCollectedDelivery delivery;

  const TransientCollectedDeliveryCard({this.delivery});

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
                  Text("#" + delivery.orderID.toString()),
                  Text(
                    "Rs. ",
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
                        builder: (context) =>
                            TransientCollectedDeliveryFullView(
                          delivery: delivery,
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
