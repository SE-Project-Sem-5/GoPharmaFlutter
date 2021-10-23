import 'package:flutter/material.dart';
import 'package:go_pharma/repos/customer/actual/order/orderList.dart';
import 'package:go_pharma/ui/common/colors.dart';

class PastOrderFullView extends StatelessWidget {
  final Orders order;
  final double leftPadding = 30.0;
  final double rightPadding = 30.0;
  const PastOrderFullView({Key key, this.order}) : super(key: key);
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
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: GoPharmaColors.PrimaryColor.withOpacity(0.2),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0,
                      horizontal: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order #" + order.id.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Ordered On: " + order.orderedDate.substring(0, 10),
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Status: " + order.status.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        HorizontalLine(),
                        Row(
                          children: [
                            Text(
                              'Ordered Products',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Qty',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Unit Price',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Total Price',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        HorizontalLine(),
                        ListView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: order.orderProducts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => OrderedItem(
                            orderProduct: order.orderProducts[index],
                            leftPadding: leftPadding,
                            rightPadding: rightPadding,
                          ),
                        ),
                        Spacer(),
                        HorizontalLine(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PastOrderTitleText(text: "Total Price"),
                            PastOrderTitleText(
                              text:
                                  "Rs. " + order.totalPrice.toStringAsFixed(2),
                            ),
                          ],
                        ),
                      ],
                    ),
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

class OrderedItem extends StatelessWidget {
  const OrderedItem({
    Key key,
    @required this.orderProduct,
    @required this.leftPadding,
    @required this.rightPadding,
  }) : super(key: key);
  final OrderProducts orderProduct;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Text(
                      orderProduct.product.productName,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      orderProduct.quantity.toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      orderProduct.product.unitPrice.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Rs. " + orderProduct.totalPrice.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        OrderProductDescriptionRow(
          rightPadding: rightPadding,
          tag: "Status: ",
          value: orderProduct.status.toUpperCase(),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class OrderProductDescriptionRow extends StatelessWidget {
  const OrderProductDescriptionRow({
    Key key,
    @required this.rightPadding,
    @required this.tag,
    @required this.value,
    this.fontSize = 13.0,
  }) : super(key: key);

  final double rightPadding;
  final String tag;
  final String value;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag + " " + value,
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black,
    );
  }
}

class PastOrderTitleText extends StatelessWidget {
  const PastOrderTitleText({
    Key key,
    this.text,
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
