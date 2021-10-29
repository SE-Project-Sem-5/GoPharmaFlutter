import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/normalOrderList.dart';
import 'package:go_pharma/ui/common/colors.dart';

import 'processing_order_full_view.dart';

class ProcessingOrderCard extends StatelessWidget {
  final NormalOrder order;
  const ProcessingOrderCard({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: GoPharmaColors.GreyColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.article_rounded,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order ID: #" + order.id.toString()),
                    Text(
                      "Rs. " + order.totalPrice.toStringAsFixed(2),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Ordered on: " + order.orderedDate.substring(0, 10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProcessingOrderStatusChip(
                      text: order.status.toUpperCase(),
                    ),
                  ),
                  TextButton(
                    child: const Text('View Details'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProcessingOrderFullView(
                            order: order,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProcessingOrderStatusChip extends StatelessWidget {
  final String text;
  ProcessingOrderStatusChip({this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.greenAccent.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      label: Container(
        width: 100,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
