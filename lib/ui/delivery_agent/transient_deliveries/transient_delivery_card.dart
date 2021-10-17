import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/transientDelivery.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/delivery_agent/transient_deliveries/transient_delivery_full_view.dart';

class TransientDeliveryCard extends StatelessWidget {
  final TransientDelivery delivery;

  const TransientDeliveryCard({this.delivery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: GoPharmaColors.GreyColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
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
                    Text(
                      "Delivery #" + delivery.orderID.toString(),
                    ),
                    Text(
                      "Rs. " + delivery.totalPrice.toStringAsFixed(2),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Text(
                  "Destination District: " + delivery.destinationDistrict,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('View Delivery Details'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransientDeliveryFullView(
                              delivery: delivery,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
