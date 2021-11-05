import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_event.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/customer/actual/product/product.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/common/widgets/back_button.dart';
import 'package:go_pharma/ui/customer/products/product_card_image.dart';
import 'components/shopping_cart.dart';
import 'horizontal_product_card.dart';

class ProductFullView extends StatelessWidget {
  static final String id = "product_full_view";
  final Product product;
  const ProductFullView({
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);

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
                  itemCount: state.productListPrescriptionless.length +
                      state.productListNeedPrescriptions.length,
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
                  imageURL: "images/pills.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width - 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  product.productName,
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
                product.productSize != null
                    ? Text(
                        "Size: " +
                            product.productSize.sizeName +
                            " (${product.productSize.description})",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87.withOpacity(0.5),
                        ),
                      )
                    : SizedBox(
                        height: 1.0,
                      ),
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
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: product.stock > 0
                      ? () {
                          print(state.productListNeedPrescriptions);
                          bloc.add(
                            UpdateProductListEvent(
                              product,
                            ),
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
                  child: (state.productIDs.contains(product.id))
                      ? ButtonText(
                          color: GoPharmaColors.WhiteColor,
                          text: 'Remove from cart',
                        )
                      : ButtonText(
                          color: GoPharmaColors.WhiteColor,
                          text: 'Add to cart',
                        ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
