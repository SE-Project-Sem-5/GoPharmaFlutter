import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';

class DeliveryAgentDrawer extends StatelessWidget {
  const DeliveryAgentDrawer({
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
              text: "Pending Deliveries",
              icon: Icons.search,
              onTap: () {},
            ),
            DrawerTile(
              text: "Reserved Deliveries",
              icon: Icons.category,
              onTap: () {},
            ),
            DrawerTile(
              text: "Collected Deliveries",
              icon: Icons.add_photo_alternate,
              onTap: () {},
            ),
            DrawerTile(
              text: "Transient Deliveries",
              icon: Icons.shopping_cart,
              onTap: () {},
            ),
            DrawerTile(
              text: "Transient-Collected Deliveries",
              icon: Icons.shopping_cart,
              onTap: () {},
            ),
            DrawerTile(
              text: "Shipped Deliveries",
              icon: Icons.history,
              onTap: () {},
            ),
            DrawerTile(
              text: "Settings",
              icon: Icons.settings,
              onTap: () {},
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
