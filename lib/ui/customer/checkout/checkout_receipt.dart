import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/customer/actual/product/orderProductModel.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_upload_prescription.dart';
import 'package:go_pharma/ui/customer/checkout/payment_option_selection.dart';

class CheckoutReceipt extends StatelessWidget {
  static final String id = "checkout_receipt";
  const CheckoutReceipt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return state.orderLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      height: MediaQuery.of(context).size.height - 300,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: GoPharmaColors.PrimaryColor.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ProductReceiptText(
                                  text: "Product",
                                  fontWeight: FontWeight.bold,
                                ),
                                ProductReceiptText(
                                  text: "Final Price (Rs.)",
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                          //TODO: add prescription uploading
                          CheckoutReceiptProductList(
                            productList: state.productListPrescriptionless +
                                state.productListNeedPrescriptions,
                          ),
                          state.productListNeedPrescriptions.length > 0
                              ? Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ProductReceiptText(
                                    text:
                                        "Note: These items need prescriptions.",
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(""),
                          CheckoutReceiptProductList(
                            showPrice: false,
                            productList: state.productListNeedPrescriptions,
                          ),
                          ReceiptInformationRow(
                            text: "Total Product Value",
                            value: state.productListTotal.toStringAsFixed(2),
                          ),
                          ReceiptInformationRow(
                            text: "Total Delivery Charge",
                            value: state.deliveryCharge.toStringAsFixed(2),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
        bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            return Container(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Your current total is Rs.${(state.deliveryCharge + state.productListTotal).toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: GoPharmaColors.BlackColor,
                        ),
                      ),
                    ),
                    state.productListNeedPrescriptions.length > 0
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                SelectOrderPrescriptionScreen.id,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: GoPharmaColors.PrimaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 20,
                              ),
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text(
                              "Upload Prescription",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                PaymentSelectionPage.id,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: GoPharmaColors.PrimaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 20,
                              ),
                              textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text(
                              "Select Payment Option",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReceiptInformationRow extends StatelessWidget {
  final String value;
  final String text;
  const ReceiptInformationRow({
    Key key,
    this.value,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProductReceiptText(
            text: this.text,
            fontWeight: FontWeight.bold,
          ),
          ProductReceiptText(
            text: "Rs. ${this.value}",
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

class CheckoutReceiptProductList extends StatelessWidget {
  final bool showPrice;
  final List<OrderProduct> productList;
  const CheckoutReceiptProductList({
    this.productList,
    Key key,
    this.showPrice = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: productList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(
          5.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductReceiptText(
              text: productList[index].productName +
                  " x" +
                  productList[index].amountOrdered.toString(),
            ),
            showPrice
                ? ProductReceiptText(
                    text: (productList[index].actualPrice *
                            productList[index].amountOrdered)
                        .toStringAsFixed(2),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class ProductReceiptText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  const ProductReceiptText(
      {Key key, this.text, this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: this.fontWeight,
      ),
    );
  }
}

getProductNames(List<OrderProduct> products) {
  List<String> names = [];
  for (OrderProduct i in products) {
    names.add(i.productName);
  }
  return names;
}

// PaymentGateway.pay(
// getProductNames(
// state.productListPrescriptionless +
// state.productListNeedPrescriptions),
// state.productListTotal,
// //TODO: pass customer name, pass order ID
// "orderID");
