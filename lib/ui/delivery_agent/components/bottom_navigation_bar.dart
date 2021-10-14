import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/bloc/delivery_agent/navigation/delivery_navigation_bloc.dart';
import 'package:go_pharma/ui/common/colors.dart';

class DeliveryAgentBottomNavigationBar extends StatelessWidget {
  const DeliveryAgentBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<DeliveryNavigationBloc>(context);
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    return BlocBuilder<DeliveryNavigationBloc, DeliveryNavigationState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          selectedFontSize: 18,
          unselectedFontSize: 18,
          selectedIconTheme: IconThemeData(
            size: 30,
          ),
          unselectedIconTheme: IconThemeData(
            size: 30,
            color: GoPharmaColors.GreyColor,
          ),
          onTap: (index) {
            if (index == 0) {
              deliveryListBloc.add(
                GetAllConfirmedOrders(
                  deliveryAgentID: 10,
                  deliveryAgentHomeAddressID: 3,
                ),
              );
            }
            navigationBloc.add(ChangeIndexEvent(index));
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.pending),
              label: 'Pending Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
