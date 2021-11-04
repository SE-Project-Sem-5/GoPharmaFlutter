import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_bloc.dart';
import 'package:go_pharma/bloc/delivery_agent/delivery_list/delivery_list_event.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/reservedDelivery.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/delivery_agent/reserved_deliveries/reserved_deliveries_page.dart';

class ReservedDeliveryFullView extends StatelessWidget {
  final ReservedDelivery delivery;
  const ReservedDeliveryFullView({@required this.delivery});
  final String bullet = "\u2022 ";
  final double leftPadding = 30.0;
  final double rightPadding = 30.0;
  @override
  Widget build(BuildContext context) {
    final deliveryListBloc = BlocProvider.of<DeliveryListBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Delivery Details"),
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
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: rightPadding,
                        ),
                        child: Text(
                          "Delivery " + delivery.id.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
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
                          'Reservation Details: ',
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
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: leftPadding, top: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product: " + delivery.productName,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Quantity: " +
                                          delivery.quantity.toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Supplier Name: " + delivery.supplierName,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Collection Point: " + delivery.address,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Delivery Point: " +
                                          delivery.district +
                                          " District Warehouse",
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: leftPadding,
                          right: rightPadding,
                          bottom: 15.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            deliveryListBloc.add(
                              CollectOrderEvent(
                                orderProductID: delivery.id,
                              ),
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              ReservedDeliveriesPage.id,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: GoPharmaColors.PrimaryColor,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(
                            "Confirm Collection",
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
