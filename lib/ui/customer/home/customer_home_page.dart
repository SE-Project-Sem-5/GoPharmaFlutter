import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_provider.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/common_skeleton.dart';
import 'package:go_pharma/ui/customer/current_orders/current_orders_page.dart';
import 'package:go_pharma/ui/customer/products/dummy_values/products/products.dart';
import 'package:go_pharma/ui/customer/products/horizontal_product_card.dart';
import 'package:go_pharma/ui/customer/products/product_categories/categories_routing_page.dart';
import 'package:go_pharma/ui/customer/profile/bold_text.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';

import '../drawer.dart';

class CustomerHomePage extends StatelessWidget {
  static const String id = "customer_home_page";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(
              'Are you sure want to leave? Any unsaved data will be lost.',
            ),
            actions: [
              ElevatedButton(
                child: Text('Yes'),
                onPressed: () {
                  willLeave = true;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
        return willLeave;
      },
      child: CommonSkeleton(
        title: "Home Page",
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BoldText(text: "Welcome to GoPharma!"),
              BoldText(
                text: "What would you like to do?",
                fontSize: 17.0,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 700,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    HomePageGrid(
                      title: "View Product Categories",
                      onClick: () {
                        Navigator.pushNamed(
                          context,
                          ProductCategoriesPage.id,
                        );
                      },
                      color: GoPharmaColors.HomeProductCategoriesColor,
                    ),
                    HomePageGrid(
                      title: "Upload a Prescription",
                      image: "images/prescription.jpg",
                      onClick: () {
                        Navigator.pushNamed(
                          context,
                          PrescriptionOrderProvider.id,
                        );
                      },
                      color: GoPharmaColors.HomePrescriptionColor,
                    ),
                    HomePageGrid(
                      title: "View Current Orders",
                      image: "images/delivery.jpg",
                      onClick: () {
                        Navigator.pushNamed(
                          context,
                          CurrentOrdersPage.id,
                        );
                      },
                      color: Colors.black,
                    ),
                    HomePageGrid(
                      title: "View Profile Settings",
                      image: "images/profile.jpg",
                      color: GoPharmaColors.PrimaryColor,
                      onClick: () {
                        Navigator.pushNamed(
                          context,
                          SettingsPage.id,
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageGrid extends StatelessWidget {
  final String title;
  final Function onClick;
  final String image;
  final Color color;

  const HomePageGrid(
      {Key key,
      this.title,
      this.onClick,
      this.image = "images/category.jpg",
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: color,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            image: DecorationImage(
              image: ExactAssetImage(
                this.image,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
