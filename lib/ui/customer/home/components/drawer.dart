import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: GoPharmaColors.textBoxColor,
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
                    "John Doe",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: GoPharmaColors.BlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
