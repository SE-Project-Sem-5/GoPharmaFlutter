import 'package:flutter/material.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'package:go_pharma/ui/customer/past_orders/past_orders_card.dart';

import 'dummy_values.dart';

class PastOrdersPage extends StatelessWidget {
  static final String id = "past_orders_page";
  const PastOrdersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonSkeleton(
        child: Container(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: pastOrders.length,
            itemBuilder: (context, index) => PastOrderCard(
              order: pastOrders[index],
            ),
          ),
        ),
        title: "Past Orders");
  }
}
