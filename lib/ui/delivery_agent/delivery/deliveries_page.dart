import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_state.dart';
import 'package:go_pharma/bloc/delivery_agent/navigation/delivery_navigation_bloc.dart';
import 'package:go_pharma/ui/delivery_agent/components/bottom_navigation_bar.dart';
import 'package:go_pharma/ui/delivery_agent/components/delivery_state_button.dart';

class DeliveriesPage extends StatelessWidget {
  static final String id = "deliveries_page";

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
          appBar: AppBar(),
          body: Container(
            child: Column(
              children: [
                BlocBuilder<DeliveryBloc, DeliveryState>(
                  builder: (context, state) {
                    return Text(
                      state.orderTransitionState.toString(),
                    );
                  },
                ),
                DeliveryStateButton(type: "Next"),
                DeliveryStateButton(type: "Previous"),
              ],
            ),
          ),
          bottomNavigationBar: DeliveryAgentBottomNavigationBar(),
        ),
      ),
    );
  }
}
