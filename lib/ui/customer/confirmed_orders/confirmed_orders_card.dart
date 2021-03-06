import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/normalOrderList.dart';
import 'package:go_pharma/ui/common/colors.dart';

import 'confirmed_order_full_view.dart';

//TODO: get the orders list for the customer ordered by the ordered date
//TODO: group orders in terms of status?
//TODO: add cancelling capability for the orderInProgress

class ConfirmedOrderCard extends StatelessWidget {
  final NormalOrder order;
  const ConfirmedOrderCard({Key key, this.order}) : super(key: key);

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
                    Text(order.id.toString()),
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
                          builder: (context) => ConfirmedOrderFullView(
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
      backgroundColor: colorMapping[text],
      label: Container(
        width: 200,
        child: Center(
          child: Text(text.toUpperCase()),
        ),
      ),
    );
  }
}

Map<String, Color> colorMapping = {
  "confirmed": Colors.green.withOpacity(0.3),
  "reserved": Colors.amberAccent.withOpacity(0.3),
  "collected": Colors.blueAccent.withOpacity(0.3),
  "transient": Colors.teal.withOpacity(0.3),
  "transient-collected": Colors.deepOrangeAccent.withOpacity(0.3),
  "shipped": Colors.lightGreenAccent.withOpacity(0.3),
};
