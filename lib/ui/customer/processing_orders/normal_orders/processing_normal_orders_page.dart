import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'processing_normal_orders_card.dart';

class ProcessingNormalOrdersPage extends StatelessWidget {
  static final String id = "processing_normal_orders";

  const ProcessingNormalOrdersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OrderListBloc>(context);
    bloc.add(
      GetOrderListByStatus(
        status: "processing",
      ),
    );
    return CommonSkeleton(
      child: BlocBuilder<OrderListBloc, OrderListState>(
        buildWhen: (p, c) => p.isLoading != c.isLoading,
        builder: (context, state) {
          return Container(
            child: state.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state.normalOrderList["processing"].orders.length > 0
                    ? RefreshIndicator(
                        //ignore: missing_return
                        onRefresh: () {
                          bloc.add(
                            GetOrderListByStatus(
                              status: "processing",
                            ),
                          );
                        },
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount:
                              state.normalOrderList["processing"].orders.length,
                          itemBuilder: (context, index) =>
                              ProcessingNormalOrderCard(
                            order: state
                                .normalOrderList["processing"].orders[index],
                          ),
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
          );
        },
      ),
      title: "Processing Orders",
    );
  }
}
