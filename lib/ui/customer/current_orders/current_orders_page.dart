import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'current_orders_card.dart';

class CurrentOrdersPage extends StatelessWidget {
  static final String id = "current_orders_page";

  const CurrentOrdersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OrderListBloc>(context);
    bloc.add(GetAllOrders(customerID: 2));
    return CommonSkeleton(
      child: BlocBuilder<OrderListBloc, OrderListState>(
        builder: (context, state) {
          return Container(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: state.orderList["processing"].orders.length,
              itemBuilder: (context, index) => CurrentOrderCard(
                order: state.orderList["processing"].orders[index],
              ),
            ),
          );
        },
      ),
      title: "Current Orders",
    );
  }
}
