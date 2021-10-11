import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/category/category_event.dart';
import 'package:go_pharma/bloc/customer/category/category_state.dart';
import 'package:go_pharma/repos/customer/actual/category/categoriesList.dart';
import 'package:go_pharma/repos/customer/actual/category/category.dart';
import 'package:go_pharma/repos/customer/actual/category/categoryAPIProvider.dart';
import 'package:go_pharma/repos/customer/actual/product/productAPIProvider.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(BuildContext context) : super(CategoryState.initialState);
  ProductAPIProvider _productAPIProvider = ProductAPIProvider();
  CategoryAPIProvider _categoryAPIProvider = CategoryAPIProvider();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case LoadAllCategories:
        yield state.clone(isLoading: true);
        CategoriesList categoriesList =
            await _categoryAPIProvider.getAllCategories();
        print(categoriesList.categoriesList);
        Map<String, ProductList> categoryProduct = state.categoryProduct;
        for (Category i in categoriesList.categoriesList) {
          categoryProduct[i.categoryName] = ProductList(products: []);
        }
        yield state.clone(
          categoryProduct: categoryProduct,
          categories: categoriesList.categoriesList,
          isLoading: false,
        );
        break;
      case LoadProductsPerCategory:
        yield state.clone(isLoading: true);
        String category = (event as LoadProductsPerCategory).category;
        print(category);
        ProductList productList = await _productAPIProvider.getAllProducts(
          category,
        );
        Map<String, ProductList> categoryProduct = state.categoryProduct;
        categoryProduct[category] = productList;
        print(categoryProduct);
        yield state.clone(
          isLoading: false,
          categoryProduct: categoryProduct,
        );
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
