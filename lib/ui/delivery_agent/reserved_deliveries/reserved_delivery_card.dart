import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/delivery_agent/reserved_deliveries/reserved_delivery_full_view.dart';

class ReservedDeliveryCard extends StatelessWidget {
  final ReservedDelivery delivery;

  const ReservedDeliveryCard({this.delivery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: GoPharmaColors.GreyColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
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
                        builder: (context) => ReservedDeliveryFullView(
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
