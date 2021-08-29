import 'package:flutter/material.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';

import 'current_orders_card.dart';
import 'dummy_values.dart';

class CurrentOrdersPage extends StatelessWidget {
  static final String id = "current_orders_page";
  const CurrentOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonSkeleton(
        child: Container(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: currentOrders.length,
            itemBuilder: (context, index) => CurrentOrderCard(
              order: currentOrders[index],
            ),
          ),
        ),
        title: "Current Orders");
  }
}
