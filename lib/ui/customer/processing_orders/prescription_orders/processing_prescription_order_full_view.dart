import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_bloc.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_event.dart';
import 'package:go_pharma/bloc/customer/order_list/order_list_state.dart';
import 'package:go_pharma/config/url.dart';
import 'package:go_pharma/repos/customer/actual/order/normalOrderList.dart';
import 'package:go_pharma/repos/customer/actual/order/prescriptionOrderList.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/processing_orders/prescription_orders/processing_prescription_orders_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProcessingPrescriptionOrderFullView extends StatelessWidget {
  final PrescriptionOrder order;
  final double leftPadding = 30.0;
  final double rightPadding = 30.0;

  const ProcessingPrescriptionOrderFullView({
    Key key,
    this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderListBloc, OrderListState>(
      listenWhen: (pre, current) => pre.isLoading != current.isLoading,
      listener: (context, state) {
        Navigator.pushReplacementNamed(
          context,
          ProcessingPrescriptionOrdersPage.id,
        );
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Order Details",
            ),
          ),
          body: Container(
            child: BlocBuilder<OrderListBloc, OrderListState>(
              builder: (context, state) {
                return Center(
                  child: state.isLoading
                      ? CircularProgressIndicator()
                      : Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      GoPharmaColors.PrimaryColor.withOpacity(
                                          0.2),
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
                                      "Ordered On: " +
                                          order.orderedDate.substring(0, 10),
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
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.9,
                                      child: ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        itemCount: order.prescriptions.length,
                                        itemBuilder: (context, index) =>
                                            Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              2,
                                          width: 150,
                                          child: Image.network(
                                            URL.baseURL +
                                                "user/images?key=" +
                                                order.prescriptions[index]
                                                    .imageName,
                                            headers: {"cookie": state.cookie},
                                            fit: BoxFit.fill,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent
                                                        loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    HorizontalLine(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            final bloc =
                                                BlocProvider.of<OrderListBloc>(
                                                    context);
                                            bloc.add(
                                              CancelOrder(
                                                orderID: order.id,
                                              ),
                                            );
                                          },
                                          child: CurrentOrderStatusChip(
                                            text: "Cancel Order",
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getCookie() async {
    final pref = await SharedPreferences.getInstance();
    String cookie = pref.get("cookie");
    print(cookie);
    return cookie;
  }
}

class OrderedItem extends StatelessWidget {
  const OrderedItem({
    Key key,
    @required this.orderProduct,
    @required this.leftPadding,
    @required this.rightPadding,
    @required this.parentContext,
  }) : super(key: key);
  final OrderProducts orderProduct;
  final double leftPadding;
  final double rightPadding;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<OrderListBloc>(context);
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
        orderProduct.status == "processing"
            ? BlocBuilder<OrderListBloc, OrderListState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      bloc.add(
                        CancelOrderProduct(
                          orderProductID: orderProduct.id,
                          context: context,
                        ),
                      );
                    },
                    child: CurrentOrderStatusChip(
                      text: "Cancel",
                    ),
                  );
                },
              )
            : SizedBox(height: 1),
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

class CurrentOrderStatusChip extends StatelessWidget {
  final String text;
  final double width;

  CurrentOrderStatusChip({this.text, this.width = 125});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: GoPharmaColors.GreyColor.withOpacity(0.3),
      label: Container(
        width: width,
        child: Center(
          child: Text(text.toUpperCase()),
        ),
      ),
    );
  }
}

bool isOrderCancellable(NormalOrder order) {
  for (var op in order.orderProducts) {
    if (op.status != "processing" && op.status != "cancelled") {
      return false;
    }
  }
  return true;
}
