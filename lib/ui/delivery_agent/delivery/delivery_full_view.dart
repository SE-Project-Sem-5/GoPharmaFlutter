import 'package:flutter/material.dart';
import 'package:go_pharma/repos/delivery_agent/delivery/delivery_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:intl/intl.dart';

class DeliveryFullView extends StatelessWidget {
  final Delivery delivery;
  const DeliveryFullView({required this.delivery});
  final String bullet = "\u2022 ";
  final double leftPadding = 30.0;
  final double rightPadding = 30.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Order Details",
          ),
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
                          vertical: 30.0,
                          horizontal: rightPadding,
                        ),
                        child: Text(
                          "Delivery " + delivery.id,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      HorizontalLine(
                          leftPadding: leftPadding, rightPadding: rightPadding),
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
                          leftPadding: leftPadding, rightPadding: rightPadding),
                      ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: leftPadding, top: 5),
                          child: Row(
                            children: [
                              Text(
                                bullet,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: rightPadding,
                                  ),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Product name placeholder",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          "Rs. 100.00",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      HorizontalLine(
                        leftPadding: leftPadding,
                        rightPadding: rightPadding,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: leftPadding,
                          right: rightPadding,
                          bottom: 100.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DeliveryTitleText(text: "Total Price"),
                            DeliveryTitleText(
                              text: "Rs. " +
                                  delivery.totalPrice.toStringAsFixed(2),
                            ),
                          ],
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
    Key? key,
    required this.leftPadding,
    required this.rightPadding,
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
    Key? key,
    required this.text,
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
