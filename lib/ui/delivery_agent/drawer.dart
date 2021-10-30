import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/delivery_agent/pending_deliveries/pending_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/reserved_deliveries/reserved_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/settings_page/view_profile.dart';
import 'package:go_pharma/ui/delivery_agent/shipped_deliveries/shipped_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/transient_collected_deliveries/transient_collected_deliveries_page.dart';
import 'package:go_pharma/ui/delivery_agent/transient_deliveries/transient_deliveries_page.dart';

import 'collected_deliveries/collected_deliveries_page.dart';

class DeliveryAgentDrawer extends StatelessWidget {
  const DeliveryAgentDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    return Drawer(
      child: Container(
        color: GoPharmaColors.WhiteColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: GoPharmaColors.PrimaryColor,
              ),
            ),
            DrawerTile(
              text: "Pending Deliveries",
              icon: Icons.search,
              onTap: () {
                deliveryListBloc.add(
                  GetAllConfirmedOrders(
                    //TODO: replace
                    deliveryAgentHomeAddressID: 3,
                  ),
                );
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  PendingDeliveriesPage.id,
                );
              },
            ),
            DrawerTile(
              text: "Reserved Deliveries",
              icon: Icons.category,
              onTap: () {
                Navigator.pop(context);
                deliveryListBloc.add(
                  GetAllReservedOrders(),
                );
                Navigator.pushReplacementNamed(
                  context,
                  ReservedDeliveriesPage.id,
                );
              },
            ),
            DrawerTile(
              text: "Collected Deliveries",
              icon: Icons.add_photo_alternate,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, CollectedDeliveriesPage.id);
              },
            ),
            DrawerTile(
              text: "Transient Deliveries",
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, TransientDeliveriesPage.id);
              },
            ),
            DrawerTile(
              text: "Transient-Collected Deliveries",
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, TransientCollectedDeliveriesPage.id);
              },
            ),
            DrawerTile(
              text: "Shipped Deliveries",
              icon: Icons.history,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, ShippedDeliveriesPage.id);
              },
            ),
            DrawerTile(
              text: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  DeliveryAgentSettingsPage.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const DrawerTile({
    Key key,
    this.text,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey.shade600,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
