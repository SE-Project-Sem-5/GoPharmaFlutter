import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_event.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/payment_gateway/payment.dart';
import 'package:go_pharma/repos/customer/dummy/product/product_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/rounded_button_filled.dart';
import 'package:go_pharma/ui/customer/profile/bold_text.dart';

class PaymentSelectionPage extends StatelessWidget {
  static final String id = "payment_selection";

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payment Selection"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15.0,
          ),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: BoldText(
                          text: "How would you like to pay for your order?",
                        ),
                      ),
                      RoundedButtonFilled(
                        title: "Confirm Payment on Delivery",
                        size: MediaQuery.of(context).size,
                        fillColor: GoPharmaColors.PrimaryColor,
                        textColor: GoPharmaColors.WhiteColor,
                        onTapped: () {
                          //TODO: add prescription order
                          bloc.add(ConfirmNormalCashPrescriptionlessOrder(
                              context: context));
                        },
                      ),
                      RoundedButtonFilled(
                        title: "Pay Online",
                        size: MediaQuery.of(context).size,
                        fillColor: GoPharmaColors.GreyColor,
                        textColor: GoPharmaColors.BlackColor,
                        onTapped: () {
                          PaymentGateway.pay(
                              getProductNames(
                                  state.productListPrescriptionless +
                                      state.productListNeedPrescriptions),
                              state.productListTotal,
                              //TODO: pass customer name, pass order ID
                              "orderID");
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
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
                        .toString(),
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
