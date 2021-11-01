import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'processing_prescription_orders_card.dart';

class ProcessingPrescriptionOrdersPage extends StatelessWidget {
  static final String id = "processing_prescription_orders";

  const ProcessingPrescriptionOrdersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OrderListBloc>(context);
    bloc.add(
      GetAllPrescriptionOrders(),
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
                : state.prescriptionOrderList.prescriptionOrder.length > 0
                    ? RefreshIndicator(
                        //ignore: missing_return
                        onRefresh: () {
                          bloc.add(
                            GetAllPrescriptionOrders(),
                          );
                        },
                        child: ListView.builder(
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: state
                              .prescriptionOrderList.prescriptionOrder.length,
                          itemBuilder: (context, index) =>
                              ProcessingPrescriptionOrderCard(
                            order: state
                                .prescriptionOrderList.prescriptionOrder[index],
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          "You have no processing orders.",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
          );
        },
      ),
      title: "Processing Prescription Orders",
    );
  }
}
