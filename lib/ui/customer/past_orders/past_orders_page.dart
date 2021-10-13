import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'package:go_pharma/ui/customer/past_orders/past_orders_card.dart';

class PastOrdersPage extends StatelessWidget {
  static final String id = "past_orders_page";
  const PastOrdersPage({Key key}) : super(key: key);

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
                            status: "delivered",
                          ),
                        );
                      },
                      child: state.orderList["delivered"].orders.length > 0
                          ? ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount:
                                  state.orderList["delivered"].orders.length,
                              itemBuilder: (context, index) => PastOrderCard(
                                order:
                                    state.orderList["delivered"].orders[index],
                              ),
                            )
                          : Center(
                              child: Text(
                                "Nothing to see here. ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                    ));
        },
      ),
      title: "Completed Orders",
    );
  }
}
