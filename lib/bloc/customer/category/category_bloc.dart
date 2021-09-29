import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/category/category_event.dart';
import 'package:go_pharma/bloc/customer/category/category_state.dart';
import 'package:go_pharma/repos/customer/actual/category/categoriesList.dart';
import 'package:go_pharma/repos/customer/actual/category/categoryAPIProvider.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(BuildContext context) : super(CategoryState.initialState);
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
        yield state.clone(
          categories: categoriesList.categoriesList,
          isLoading: false,
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
