import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/product/product_model.dart';
import 'package:go_pharma/ui/common/colors.dart';

class CheckoutReceipt extends StatelessWidget {
  static final String id = "checkout_receipt";
  const CheckoutReceipt({Key? key}) : super(key: key);

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
              return Container(
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
                    CheckoutReceiptProductList(
                      productList: state.productListPrescriptionless,
                    ),
                    ProductReceiptText(text: "These items need prescriptions."),
                    CheckoutReceiptProductList(
                      productList: state.productListNeedPrescriptions,
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
                        "Your current total is Rs.${state.productListTotal.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: GoPharmaColors.BlackColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: state.productListTotal > 0
                          ? () {
                              Navigator.pushNamed(
                                context,
                                CheckoutReceipt.id,
                              );
                            }
                          : null,
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
                        "Proceed to Payment",
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

class CheckoutReceiptProductList extends StatelessWidget {
  final List<Product> productList;
  const CheckoutReceiptProductList({
    required this.productList,
    Key? key,
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
              text: productList[index].name +
                  " x" +
                  productList[index].amountOrdered.toString(),
            ),
            ProductReceiptText(
              text:
                  (productList[index].price * productList[index].amountOrdered)
                      .toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductReceiptText extends StatelessWidget {
  final String text;
  const ProductReceiptText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
