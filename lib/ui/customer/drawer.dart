import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_provider.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_provider.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/past_orders/past_orders_page.dart';
import 'package:go_pharma/ui/customer/processing_orders/select_order_type.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';
import 'package:go_pharma/ui/customer/search_page/search_page_routing.dart';
import 'confirmed_orders/confirmed_orders_page.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OrderListBloc>(context);

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
              text: "Search for Product",
              icon: Icons.search,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  SearchPageRouting.id,
                );
              },
            ),
            DrawerTile(
              text: "Product Categories",
              icon: Icons.category,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  CategoryProvider.id,
                );
              },
            ),
            DrawerTile(
              text: "Upload Prescription",
              icon: Icons.add_photo_alternate,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  PrescriptionOrderProvider.id,
                );
              },
            ),
            DrawerTile(
              text: "Processing Orders",
              icon: Icons.shopping_cart,
              onTap: () {
                bloc.add(
                  GetAllNormalOrders(),
                );
                bloc.add(
                  GetAllPrescriptionOrders(),
                );
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  SelectProcessingOrderType.id,
                );
              },
            ),
            DrawerTile(
              text: "Confirmed Orders",
              icon: Icons.shopping_cart,
              onTap: () {
                bloc.add(
                  GetAllNormalOrders(),
                );
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  ConfirmedOrdersPage.id,
                );
              },
            ),
            DrawerTile(
              text: "Completed Orders",
              icon: Icons.history,
              onTap: () {
                Navigator.pop(context);
                bloc.add(
                  GetAllNormalOrders(),
                );
                Navigator.pushNamed(
                  context,
                  PastOrdersPage.id,
                );
              },
            ),
            DrawerTile(
              text: "Settings",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  SettingsPage.id,
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
