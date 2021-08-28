import 'package:flutter/material.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/checkout/checkout_receipt.dart';
import 'package:go_pharma/ui/customer/products/product_categories/specific_category_page.dart';

class ProductCategoryCard extends StatelessWidget {
  final String category;
  const ProductCategoryCard({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GoPharmaColors.GreyColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: GoPharmaColors.GreyColor.withOpacity(0.1),
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
              builder: (context) => SpecificCategoryPage(
                category: category,
              ),
            ),
          );
        },
        child: Center(
          child: ProductReceiptText(
            text: category,
          ),
        ),
      ),
    );
  }
}
