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
    return CommonSkeleton(
      child: BlocBuilder<OrderListBloc, OrderListState>(
        buildWhen: (p, c) => p.isLoading != c.isLoading,
        builder: (context, state) {
          return Container(
            child: state.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    //ignore: missing_return
                    onRefresh: () {
                      final bloc = BlocProvider.of<OrderListBloc>(context);
                      bloc.add(
                        GetOrderListByStatus(
                          customerID: 2,
                          status: "processing",
                        ),
                      );
                    },
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: state.orderList["processing"].orders.length,
                      itemBuilder: (context, index) => CurrentOrderCard(
                        order: state.orderList["processing"].orders[index],
                      ),
                    ),
                  ),
          );
        },
      ),
      title: "Current Orders",
    );
  }
}
