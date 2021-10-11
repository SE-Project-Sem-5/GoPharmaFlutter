import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/dummy/order/current_order_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:intl/intl.dart';

import 'current_order_full_view.dart';

//TODO: get the orders list for the customer ordered by the ordered date
//TODO: group orders in terms of status?
//TODO: add cancelling capability for the orderInProgress

class CurrentOrderCard extends StatelessWidget {
  final CurrentOrder order;
  const CurrentOrderCard({Key key, this.order}) : super(key: key);

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
                    Text(order.orderId),
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

class CurrentOrderStatusChip extends StatelessWidget {
  final String text;
  CurrentOrderStatusChip({this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      label: Container(
        width: 75,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
