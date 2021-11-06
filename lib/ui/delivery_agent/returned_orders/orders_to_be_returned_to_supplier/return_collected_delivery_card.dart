import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/returnCollectedOrderList.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/delivery_agent/returned_orders/orders_to_be_returned_to_supplier/return_collected_deliveries_page.dart';

class ReturnCollectedDeliveryCard extends StatelessWidget {
  final ReturnCollectedOrders delivery;

  const ReturnCollectedDeliveryCard({this.delivery});

  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: GoPharmaColors.GreyColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(
                  Icons.article_rounded,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery #" + delivery.id.toString()),
                    Text(
                      "Rs. " + delivery.totalPrice.toStringAsFixed(2),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Text(
                  "Customer Address: " + delivery.customerAddress,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Text(
                  "Customer Contact Number: " + delivery.customerContactNo,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 70,
                  right: 30,
                  bottom: 15.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    deliveryListBloc.add(
                      ConfirmOrderReturn(
                        orderProductID: delivery.id,
                      ),
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      ReturnCollectedDeliveriesPage.id,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: GoPharmaColors.PrimaryColor,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text(
                    "Confirm Return To Customer",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
