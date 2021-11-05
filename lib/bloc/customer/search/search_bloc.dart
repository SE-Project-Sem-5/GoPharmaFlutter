import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_pharma/bloc/customer/search/search_event.dart';
import 'package:go_pharma/bloc/customer/search/search_state.dart';
import 'package:go_pharma/repos/customer/actual/product/productList.dart';
import 'dart:async';

import 'package:go_pharma/repos/customer/actual/search/searchAPIProvider.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(BuildContext context) : super(SearchState.initialState);
  SearchAPIProvider searchAPIProvider = new SearchAPIProvider();
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(
          error: error,
        );
        break;
      case UpdateFilterEvent:
        final String filter = (event as UpdateFilterEvent).filter;
        yield state.clone(
          filter: filter,
        );
        break;
      case ProductSearchEvent:
        final String searchValue = (event as ProductSearchEvent).searchValue;
        final ProductList products =
            await searchAPIProvider.searchProducts(state.filter, searchValue);
        Map<String, ProductList> searchResults = state.searchResults;
        searchResults[state.filter] = products;
        yield state.clone(
          searchResults: searchResults,
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
