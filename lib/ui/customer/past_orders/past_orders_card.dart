import 'package:flutter/material.dart';
import 'package:go_pharma/repos/order/order_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/past_orders/order_full_view.dart';
import 'package:intl/intl.dart';

class PastOrderCard extends StatelessWidget {
  final Order order;

  const PastOrderCard({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
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
                    Text(order.order_id),
                    Text(
                      "Rs. " + order.price.toStringAsFixed(2),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Ordered on: " +
                      DateFormat.yMMMMd('en_US').format(order.orderedDate),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('View Details'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderFullView(
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
