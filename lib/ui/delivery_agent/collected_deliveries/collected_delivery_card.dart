import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/collectedDelivery.dart';

import 'collected_delivery_full_view.dart';

class CollectedDeliveryCard extends StatelessWidget {
  final CollectedDelivery delivery;

  const CollectedDeliveryCard({this.delivery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.article_rounded,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("#" + delivery.id.toString()),
                  Text(
                    "Rs. " + delivery.totalPrice.toStringAsFixed(2),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text("Current Location: " + delivery.currentLocation),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text("Destination Location: " +
                  delivery.district +
                  " District Warehouse"),
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
                        builder: (context) => CollectedDeliveryFullView(
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
