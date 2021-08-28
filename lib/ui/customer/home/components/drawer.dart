import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/camera/select_photo_screen.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    Key? key,
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
                color: GoPharmaColors.PrimaryColor.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                      color: GoPharmaColors.PrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Customer Name",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: GoPharmaColors.BlackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DrawerTile(
              text: "Search for Product",
              icon: Icons.search,
              onTap: () {},
            ),
            DrawerTile(
              text: "Product Categories",
              icon: Icons.category,
              onTap: () {},
            ),
            DrawerTile(
              text: "Upload Prescription",
              icon: Icons.add_photo_alternate,
              onTap: () {
                print("sdjfn");
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  SelectPhotoScreen.id,
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
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
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
