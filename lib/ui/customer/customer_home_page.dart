import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_provider.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/prescription_order/prescription_order_provider.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/processing_orders/select_order_type.dart';
import 'package:go_pharma/ui/customer/profile/view_profile.dart';
import 'package:go_pharma/ui/customer/search_page/search_page_routing.dart';

import 'confirmed_orders/confirmed_orders_page.dart';
import 'drawer.dart';

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
      child: SafeArea(
        child: Scaffold(
          drawer: CustomerDrawer(),
          appBar: AppBar(
            title: Text(
              "Home Page",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10,
            ),
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                HomePageGrid(
                  image: "images/s_1.jpg",
                  title: "Search For Products",
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      SearchPageRouting.id,
                    );
                  },
                ),
                HomePageGrid(
                  title: "View Product Categories",
                  image: "images/Cat_2.jpg",
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      CategoryProvider.id,
                    );
                  },
                ),
                HomePageGrid(
                  title: "Upload a Prescription",
                  image: "images/Pres.jpg",
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      PrescriptionOrderProvider.id,
                    );
                  },
                ),
                HomePageGrid(
                  title: "View Processing Orders",
                  image: "images/Orders.jpg",
                  onClick: () {
                    final bloc = BlocProvider.of<OrderListBloc>(context);
                    bloc.add(
                      GetAllNormalOrders(),
                    );
                    bloc.add(
                      GetAllPrescriptionOrders(),
                    );
                    Navigator.pushNamed(
                      context,
                      SelectProcessingOrderType.id,
                    );
                  },
                ),
                HomePageGrid(
                  title: "View Orders in Progress",
                  image: "images/Cat_1.jpg",
                  onClick: () {
                    final bloc = BlocProvider.of<OrderListBloc>(context);
                    bloc.add(
                      GetAllNormalOrders(),
                    );
                    Navigator.pushNamed(
                      context,
                      ConfirmedOrdersPage.id,
                    );
                  },
                ),
                HomePageGrid(
                  title: "View Profile Information",
                  image: "images/h_profile.jpg",
                  onClick: () {
                    Navigator.pushNamed(
                      context,
                      SettingsPage.id,
                    );
                  },
                ),
              ],
            ),
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

  const HomePageGrid({
    Key key,
    this.title,
    this.onClick,
    this.image = "images/Cat_1.jpg",
    this.color = GoPharmaColors.PrimaryColor,
  }) : super(key: key);

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
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
