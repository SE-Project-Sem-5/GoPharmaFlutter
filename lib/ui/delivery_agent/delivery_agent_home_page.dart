import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery/delivery_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/navigation/delivery_navigation_bloc.dart';

import 'components/bottom_navigation_bar.dart';

class DeliveryAgentHomePage extends StatelessWidget {
  static const id = "delivery_agent_home_page";
  final String title = "Delivery Agent Home Page";

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
          bottomNavigationBar: DeliveryAgentBottomNavigationBar(),
        ),
      ),
    );
  }
}
