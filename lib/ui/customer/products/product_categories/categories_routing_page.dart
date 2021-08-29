import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/home/components/drawer.dart';
import 'package:go_pharma/ui/customer/products/components/shopping_cart.dart';
import 'package:go_pharma/ui/customer/products/dummy_values/categories/categories.dart';

import 'category_card.dart';

class ProductCategoriesPage extends StatelessWidget {
  static final String id = "product_categories_page";
  const ProductCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: GridView.count(
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                children: productCategories.map<Widget>((String category) {
                  return GridTile(
                    child: ProductCategoryCard(
                      category: category,
                    ),
                  );
                }).toList()),
          ),
        ),
      ),
    );
  }
}
