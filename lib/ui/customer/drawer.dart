import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/past_orders/past_orders_page.dart';
import 'package:go_pharma/ui/customer/prescription_order/prescription_order.dart';
import 'package:go_pharma/ui/customer/products/product_categories/categories_routing_page.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';
import 'package:go_pharma/ui/customer/search_page/search_page.dart';

import 'current_orders/current_orders_page.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  SearchPage.id,
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
                  ProductCategoriesPage.id,
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
                  PrescriptionOrderPage.id,
                );
              },
            ),
            DrawerTile(
              text: "Orders in Progress",
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  CurrentOrdersPage.id,
                );
              },
            ),
            DrawerTile(
              text: "Past Orders",
              icon: Icons.history,
              onTap: () {
                Navigator.pop(context);
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
