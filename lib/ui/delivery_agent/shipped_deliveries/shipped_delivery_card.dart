import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/shippedOrderList.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/delivery_agent/shipped_deliveries/shipped_delivery_full_view.dart';

class ShippedDeliveryCard extends StatelessWidget {
  final ShippedDelivery delivery;

  const ShippedDeliveryCard({this.delivery});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(
                Icons.article_rounded,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery #" + delivery.orderID.toString()),
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
                "Customer Name: " + delivery.customerName,
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: Text(
                "Customer Address: " + delivery.customerAddress,
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: Text(
                "Customer Contact Number: " + delivery.customerContactNumber,
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
                          builder: (context) => ShippedDeliveryFullView(
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
    );
  }
}
