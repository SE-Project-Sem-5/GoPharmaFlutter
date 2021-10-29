import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_event.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/customer/actual/product/orderProductModel.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/back_button.dart';
import 'package:go_pharma/ui/customer/checkout/address_information.dart';
import 'package:go_pharma/ui/customer/products/shopping_cart_page_product_card.dart';

class ShoppingCartPage extends StatelessWidget {
  static final String id = "shopping_cart";

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(),
        ),
        body: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            List<OrderProduct> orderProducts =
                state.productListNeedPrescriptions +
                    state.productListPrescriptionless;
            return Container(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: orderProducts.length,
                itemBuilder: (context, index) => ShoppingCartPageProductCard(
                  orderProduct: orderProducts[index],
                  product: orderProducts[index].product,
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
                              bloc.add(
                                GetAllCities(),
                              );
                              Navigator.pushNamed(
                                context,
                                AddressInformationPage.id,
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
                        "Enter Address Details",
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
