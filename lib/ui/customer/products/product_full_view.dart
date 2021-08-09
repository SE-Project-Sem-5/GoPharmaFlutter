import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/product/product_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/back_button.dart';
import 'package:go_pharma/ui/customer/products/square_product_card.dart';

import 'components/shopping_cart.dart';

class ProductFullView extends StatelessWidget {
  static final String id = "product_full_view";
  final Product product;
  const ProductFullView({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton(),
          actions: [
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                return ShoppingCart(
                  itemCount: state.productList.length,
                );
              },
            ),
          ],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductCardImage(
                  padding: 0,
                  imageURL: product.imageURL,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width - 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: GoPharmaColors.BlackColor,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87.withOpacity(0.5),
                  ),
                ),
                //  TODO: add an option to edit the amount bought
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 20.0,
            ),
            child: ElevatedButton(
              onPressed: () {},
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
                "Add to Cart",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
