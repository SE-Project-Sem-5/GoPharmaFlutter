import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/collectedDelivery.dart';
import 'package:go_pharma/ui/common/colors.dart';

import 'collected_deliveries_page.dart';

class CollectedDeliveryFullView extends StatelessWidget {
  final CollectedDelivery delivery;
  const CollectedDeliveryFullView({@required this.delivery});
  final String bullet = "\u2022 ";
  final double leftPadding = 30.0;
  final double rightPadding = 30.0;
  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Collected Deliveries"),
        ),
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: GoPharmaColors.PrimaryColor.withOpacity(0.2),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          bottom: 10.0,
                          left: rightPadding,
                          right: rightPadding,
                        ),
                        child: Text(
                          "Delivery " + delivery.id.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: rightPadding,
                        ),
                        child: Text(
                          "Destination: " +
                              delivery.district +
                              " District Warehouse",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      HorizontalLine(
                        leftPadding: leftPadding,
                        rightPadding: rightPadding,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: leftPadding),
                        child: Text(
                          'Products Ordered:',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      HorizontalLine(
                        leftPadding: leftPadding,
                        rightPadding: rightPadding,
                      ),
                      ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: delivery.products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: leftPadding, top: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: rightPadding,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product name: ${delivery.products[index].product.productName}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        "Quantity: ${delivery.products[index].quantity.toString()}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        "Total Price: ${delivery.products[index].totalPrice.toStringAsFixed(2)}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HorizontalLine(
                        leftPadding: leftPadding,
                        rightPadding: rightPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            print(delivery.id);
                            deliveryListBloc.add(
                              TransitionOrderEvent(
                                orderID: delivery.id,
                              ),
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              CollectedDeliveriesPage.id,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: GoPharmaColors.PrimaryColor,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(
                            "Confirm Delivery Transition",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key key,
    @required this.leftPadding,
    @required this.rightPadding,
  }) : super(key: key);

  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
      ),
      child: Divider(
        color: Colors.black,
      ),
    );
  }
}

class DeliveryTitleText extends StatelessWidget {
  const DeliveryTitleText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

const Map<String, String> deliveryAgentButtonMapping = {
  //mapping is from previous state, and the value is what the next state will be
  "confirmed": "Confirm Collection",
  "collected": "Confirm Transition",
  "transient": "Confirm Shipping",
  "shipped": "Confirm Delivery",
  "delivered": "This delivery has been completed.",
};
