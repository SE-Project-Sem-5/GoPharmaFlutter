import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/customer/dummy/product/product_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/back_button.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_receipt.dart';
import 'package:go_pharma/ui/customer/products/shopping_cart_page_product_card.dart';

class ShoppingCartPage extends StatelessWidget {
  static final String id = "shopping_cart";

  const ShoppingCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(),
        ),
        body: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            List<Product> products = state.productListNeedPrescriptions +
                state.productListPrescriptionless;
            return Container(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) => ShoppingCartPageProductCard(
                  product: products[index],
                ),
              ),
            );
          },
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
                        state.productListTotal > 0
                            ? "Your current total is Rs.${state.productListTotal.toStringAsFixed(2)}"
                            : "You have no items in your cart.",
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
                        "Proceed to Checkout",
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
