import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/navigation/delivery_navigation_bloc.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/delivery_agent/components/bottom_navigation_bar.dart';
import 'package:go_pharma/ui/delivery_agent/dummy_values/deliveries.dart';

import 'delivery_card.dart';

class DeliveriesPage extends StatelessWidget {
  //TODO:replace with the list gotten from the backend
  List<Delivery> deliveries = dummyDeliveries;
  static final String id = "deliveries_page";
  final String title = "Deliveries";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DeliveryNavigationBloc>(
          create: (context) => DeliveryNavigationBloc(
            context,
          ),
        ),
        BlocProvider<DeliveryBloc>(
          create: (_) => DeliveryBloc(_),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Container(),
            title: Row(
              children: [
                Text(title),
              ],
            ),
          ),
          body: Container(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: deliveries.length,
              itemBuilder: (context, index) => DeliveryCard(
                delivery: deliveries[index],
              ),
            ),
          ),
          bottomNavigationBar: DeliveryAgentBottomNavigationBar(),
        ),
      ),
    );
  }
}
