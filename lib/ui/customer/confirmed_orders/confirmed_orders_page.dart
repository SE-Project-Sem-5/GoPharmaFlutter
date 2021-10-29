import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';
import 'package:go_pharma/repos/customer/actual/order/normalOrderList.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'confirmed_orders_card.dart';

class ConfirmedOrdersPage extends StatelessWidget {
  static final String id = "confirmed_orders_page";

  const ConfirmedOrdersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonSkeleton(
      child: BlocBuilder<OrderListBloc, OrderListState>(
        buildWhen: (p, c) => p.isLoading != c.isLoading,
        builder: (context, state) {
          final List<NormalOrder> orders =
              state.normalOrderList["confirmed"].orders +
                  state.normalOrderList["reserved"].orders +
                  state.normalOrderList["collected"].orders +
                  state.normalOrderList["transient"].orders +
                  state.normalOrderList["transient-collected"].orders +
                  state.normalOrderList["shipped"].orders;

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
                        GetAllNormalOrders(),
                      );
                    },
                    child: orders.length > 0
                        ? ListView.builder(
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: orders.length,
                            itemBuilder: (context, index) => ConfirmedOrderCard(
                              order: orders[index],
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
                  ),
          );
        },
      ),
      title: "Confirmed Orders",
    );
  }
}
