import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_event.dart';
import 'package:go_pharma/bloc/customer/category/category_state.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_bloc.dart';
import 'package:go_pharma/bloc/customer/checkout/checkout_state.dart';
import 'package:go_pharma/ui/common/colors.dart';
import 'package:go_pharma/ui/customer/drawer.dart';
import 'package:go_pharma/ui/customer/products/components/shopping_cart.dart';
import '../horizontal_product_card.dart';

class SpecificCategoryPage extends StatelessWidget {
  static final String id = "specific_category_page";
  String category;

  SpecificCategoryPage({this.category});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CategoryBloc>(context);
    bloc.add(LoadProductsPerCategory(category: category));

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category),
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
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return state.isLoading ||
                    state.categoryProduct[category] == null ||
                    state.categoryProduct[category].products == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount:
                          state.categoryProduct[category].products.length,
                      itemBuilder: (context, index) => HorizontalProductCard(
                        product:
                            state.categoryProduct[category].products[index],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
