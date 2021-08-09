import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_bloc.dart';
import 'package:go_pharma/bloc/internet_connectivity/internet_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/home/customer_home_page.dart';
import 'package:go_pharma/ui/customer/sign_in/other_files/sign_in_start.dart';
import 'package:go_pharma/ui/delivery_agent/delivery/deliveries_page.dart';
import 'common/widgets/rounded_button.dart';
import 'customer/camera/select_photo_screen.dart';
import 'customer/sign_up/sign_up.dart';

class MainPage extends StatelessWidget {
  static const id = "home_page";
  final String title = "Home Page";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocListener<InternetBloc, InternetState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.connection.toString(),
              ),
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Text(title),
              ],
            ),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to GoPharma",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RoundedButtonFilled(
                  title: "LOGIN",
                  size: size,
                  onTapped: () => Navigator.pushNamed(
                    context,
                    SignInStart.id,
                  ),
                ),
                RoundedButtonFilled(
                  title: "SIGN UP",
                  size: size,
                  fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                  textColor: GoPharmaColors.BlackColor,
                  onTapped: () => Navigator.pushNamed(
                    context,
                    SignUpStart.id,
                  ),
                ),
                RoundedButtonFilled(
                  title: "CUSTOMER HOME PAGE",
                  size: size,
                  fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                  textColor: GoPharmaColors.BlackColor,
                  onTapped: () => Navigator.pushNamed(
                    context,
                    CustomerHomePage.id,
                  ),
                ),
                RoundedButtonFilled(
                  title: "DELIVERY AGENT HOME PAGE",
                  size: size,
                  fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                  textColor: GoPharmaColors.BlackColor,
                  onTapped: () => Navigator.pushNamed(
                    context,
                    DeliveriesPage.id,
                  ),
                ),
                RoundedButtonFilled(
                  title: "CAMERA SCREEN",
                  size: size,
                  fillColor: GoPharmaColors.GreyColor.withOpacity(0.5),
                  textColor: GoPharmaColors.BlackColor,
                  onTapped: () => Navigator.pushNamed(
                    context,
                    SelectPhotoScreen.id,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// drawer: Drawer(
// child: ListView(
// // Important: Remove any padding from the ListView.
// padding: EdgeInsets.zero,
// children: <Widget>[
// DrawerHeader(
// decoration: BoxDecoration(
// color: GoPharmaColors.SecondaryColor,
// ),
// child: Text(
// 'Drawer Header',
// style: TextStyle(
// color: Colors.white,
// ),
// ),
// ),
// ListTile(
// title: Text('Item 1'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ListTile(
// title: Text('Item 2'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ],
// ),
// ),
