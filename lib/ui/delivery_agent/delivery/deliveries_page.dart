import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_state.dart';
import 'delivery_card.dart';

class DeliveriesPage extends StatelessWidget {
  //TODO:replace with the list gotten from the backend
  static final String id = "deliveries_page";
  final String title = "Deliveries";

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);

    return BlocBuilder<DeliveryListBloc, DeliveryListState>(
      builder: (context, state) {
        return state.isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                child: RefreshIndicator(
                  //ignore: missing_return
                  onRefresh: () {
                    deliveryListBloc.add(
                      GetAllConfirmedOrders(
                        deliveryAgentID: 10,
                        deliveryAgentHomeAddressID: 3,
                      ),
                    );
                  },
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: state.confirmedOrders.deliveries.length,
                    itemBuilder: (context, index) => DeliveryCard(
                      delivery: state.confirmedOrders.deliveries[index],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
