import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_event.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/product/product_model.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/products/product_full_view.dart';

class SquareProductCard extends StatelessWidget {
  final Product product;

  const SquareProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CheckoutBloc>(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 350,
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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductFullView(
                  product: product,
                ),
              ),
            );
          },
          child: Container(
            child: Column(
              children: [
                ProductCardImage(
                  imageURL: product.imageURL,
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: GoPharmaColors.BlackColor,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                product.inStock
                    ? Container()
                    : Container(
                        height: 40,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              text: "This item is currently out of stock.",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: GoPharmaColors.PrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 5.0,
                ),
                product.inStock
                    ? BlocBuilder<CheckoutBloc, CheckoutState>(
                        builder: (context, state) {
                          if (product.amountOrdered > 0) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProductActionIcon(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    product.decrementAmount();
                                    bloc.add(
                                      UpdateProductAmountEvent(),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    "${product.amountOrdered} ${product.unitOfMeasure}",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                                ProductActionIcon(
                                  icon: Icons.add,
                                  onPressed: () {
                                    product.incrementAmount();
                                    bloc.add(UpdateProductAmountEvent());
                                  },
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              height: 40,
                            );
                          }
                        },
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Rs.${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: GoPharmaColors.BlackColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          side: BorderSide(
                            width: 1,
                            color: GoPharmaColors.PrimaryColor,
                          ),
                        ),
                        onPressed: product.inStock
                            ? () {
                                bloc.add(
                                  UpdateProductListEvent(
                                    product,
                                  ),
                                );
                              }
                            : null,
                        child: (state.productList.contains(product))
                            ? Text(
                                'Remove from cart',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            : Text(
                                'Add to Cart',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ProductActionIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: Random().nextInt(100000).toString(),
          child: Icon(
            this.icon,
            color: Colors.black87,
          ),
          backgroundColor: GoPharmaColors.GreyColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class ProductCardImage extends StatelessWidget {
  final double height;
  final double width;
  final double padding;

  const ProductCardImage({
    Key? key,
    required this.imageURL,
    this.height = 125.0,
    this.width = 125.0,
    this.padding = 10,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        this.padding,
      ),
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: GoPharmaColors.PrimaryColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          image: DecorationImage(
            image: ExactAssetImage(
              imageURL,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
