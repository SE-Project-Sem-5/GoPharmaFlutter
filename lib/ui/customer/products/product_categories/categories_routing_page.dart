import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_event.dart';
import 'package:go_pharma/bloc/customer/category/category_state.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/repos/customer/actual/category/category.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/drawer.dart';
import 'package:go_pharma/ui/customer/products/components/shopping_cart.dart';
import 'package:go_pharma/ui/customer/products/dummy_values/categories/categories.dart';
import 'category_card.dart';

class ProductCategoriesPage extends StatelessWidget {
  const ProductCategoriesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CategoryBloc>(context);
    bloc.add(LoadAllCategories());
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
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return state.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      child: GridView.count(
                          physics: ClampingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          padding: const EdgeInsets.all(4.0),
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          children:
                              state.categories.map<Widget>((Category category) {
                            return GridTile(
                              child: ProductCategoryCard(
                                category: category,
                              ),
                            );
                          }).toList()),
                    );
            },
          ),
        ),
      ),
    );
  }
}
