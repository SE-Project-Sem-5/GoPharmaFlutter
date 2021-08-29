import 'package:flutter/material.dart';
import 'package:go_pharma/repos/order/order_model.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'package:intl/intl.dart';

class OrderFullView extends StatelessWidget {
  final Order order;
  const OrderFullView({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Order Details",
          ),
        ),
        body: Container(
          child: Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle),
                    title: Text("Order " + order.order_id),
                    subtitle: Text(
                      "Ordered on: " +
                          DateFormat.yMMMMd('en_US').format(order.orderedDate),
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
