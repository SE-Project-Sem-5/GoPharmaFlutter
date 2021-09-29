import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_bloc.dart';
import 'package:go_pharma/bloc/customer/category/category_state.dart';
import 'package:go_pharma/ui/customer/products/product_categories/categories_routing_page.dart';

class CategoryProvider extends BlocProvider<CategoryBloc> {
  static final String id = "product_categories_page";

  CategoryProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CategoryBloc(context),
          child: CategoryView(),
        );
}

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<CategoryBloc, CategoryState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error.isNotEmpty) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: ProductCategoriesPage(),
    );
  }
}
