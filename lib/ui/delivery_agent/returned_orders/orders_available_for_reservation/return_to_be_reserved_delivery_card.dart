import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnReservedOrderList.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/delivery_agent/returned_orders/orders_available_for_reservation/return_to_be_reserved_delivery_full_view.dart';

class ReturnToBeReservedDeliveryCard extends StatelessWidget {
  final ReturnToBeReservedDelivery delivery;

  const ReturnToBeReservedDeliveryCard({this.delivery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: GoPharmaColors.GreyColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  Icons.article_rounded,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery #" + delivery.id.toString()),
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
                  "Customer Address: " + delivery.customerAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Text(
                  "Destination: " + delivery.supplierAddress,
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
                            builder: (context) =>
                                ReturnToBeReservedDeliveryFullView(
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
