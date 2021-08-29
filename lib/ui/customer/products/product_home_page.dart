import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/home/components/drawer.dart';
import 'package:go_pharma/ui/customer/products/dummy_values/products/products.dart';
import 'components/shopping_cart.dart';
import 'horizontal_product_card.dart';

class ProductHomePage extends StatelessWidget {
  static final String id = "product_home_page";
  //Rough skeleton for how all product pages would appear
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          //TODO: Add product page title here?
          backgroundColor: GoPharmaColors.PrimaryColor,
          elevation: 0,
          actions: [
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                return ShoppingCart(
                  color: GoPharmaColors.WhiteColor,
                  itemCount: state.productListPrescriptionless.length +
                      state.productListNeedPrescriptions.length,
                );
              },
            ),
          ],
        ),
        drawer: CustomerDrawer(),
        body: Container(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) => HorizontalProductCard(
              product: products[index],
            ),
          ),
        ),
      ),
    );
  }
}
