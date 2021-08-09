import 'package:badges/badges.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/ui/customer/products/shopping_cart_page.dart';

class ShoppingCart extends StatelessWidget {
  final Color color;
  final int itemCount;
  const ShoppingCart({
    this.color = GoPharmaColors.PrimaryColor,
    this.itemCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ShoppingCartPage.id,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 30.0,
        ),
        child: itemCount > 0
            ? Badge(
                badgeColor: GoPharmaColors.GreyColor,
                toAnimate: true,
                badgeContent: Text("$itemCount"),
                child: Icon(
                  Icons.shopping_cart,
                  size: 30.0,
                  color: this.color,
                ),
              )
            : Icon(
                Icons.shopping_cart,
                size: 30.0,
                color: this.color,
              ),
      ),
    );
  }
}
