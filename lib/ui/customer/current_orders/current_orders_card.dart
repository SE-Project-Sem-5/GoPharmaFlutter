import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/order/current_order_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:intl/intl.dart';

import 'current_order_full_view.dart';

//TODO: get the orders list for the customer ordered by the ordered date
//TODO: group orders in terms of status?
//TODO: add cancelling capability for the order

class CurrentOrderCard extends StatelessWidget {
  final CurrentOrder order;
  const CurrentOrderCard({Key? key, required this.order}) : super(key: key);

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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CurrentOrderStatusChip(
                      text: order.status,
                    ),
                  ),
                  TextButton(
                    child: const Text('View Details'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CurrentOrderFullView(
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

Map<String, Color> orderStatusColorMapping = {
  "Processing": Colors.blueAccent.withOpacity(0.2),
  "Packing": Colors.orange.withOpacity(0.2),
  "Being Delivered": GoPharmaColors.PrimaryColor.withOpacity(0.2),
  "Delivered": Colors.green.withOpacity(0.2),
};

class CurrentOrderStatusChip extends StatelessWidget {
  final String text;
  CurrentOrderStatusChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: orderStatusColorMapping[text],
      label: Text(text),
    );
  }
}
